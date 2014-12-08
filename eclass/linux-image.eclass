# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: linux-image.eclass
# @MAINTAINER: hollow@gentoo.org
# @BLURB: eclass used for installing prebuilt linux kernel images

IUSE=""
SLOT="${PV}"

DEPEND=""
RDEPEND="sys-apps/util-linux"

RESTRICT="binchecks strip"

S=${WORKDIR}

linux-image_src_install() {
	mv "${S}"/* "${D}"/ || die
}

linux-image_pkg_postinst() {
	ebegin "Updating module dependencies for ${KV_FULL}"
	depmod -a -b "${ROOT}" ${KV_FULL}
	eend $?
}

linux-image_pkg_config() {
	emerge --nospinner -q -n sys-boot/grub:2

	root_device=$(grep ' / ' /proc/mounts | grep -v ^rootfs | grep -v ^aufs | grep -v ^/dev/root | grep -v tmpfs | awk '{ print $1 }')
	if [[ -z ${root_device} ]]; then
		die "unable to detect rootfs"
	fi

	einfo "Found root device at '${root_device}'"

	# convert fstab entries to UUID
	ebegin "Converting fstab entries to UUID"
	grep -v ^# /etc/fstab | grep -v '^$' | {
		while read fs mp type opts dump pass; do
			if [[ $fs == UUID* ]]; then
				echo $fs $mp $type $opts $dump $pass
			else
				echo UUID=$(blkid -s UUID -o value $fs) $mp $type $opts $dump $pass
			fi
		done
	} > /etc/fstab.uuid
	mv /etc/fstab.uuid /etc/fstab
	eend $?

	# kernel command line
	if mdadm --detail $root_device &>/dev/null; then
		cmdline="${cmdline} rd.md=1"
	fi

	if [[ "$(lvs 2>/dev/null)" != "" ]]; then
		cmdline="${cmdline} rd.lvm=1 rd.lvm.vg=vg"
	fi

	cmdline="${cmdline} rd.auto=1 net.ifnames=0 init=/usr/lib/systemd/systemd"

	einfo "Using kernel command line '${cmdline}'"
	sed -i -e "/GRUB_CMDLINE_LINUX=/s:.*:GRUB_CMDLINE_LINUX=\"${cmdline}\":" /etc/default/grub
	mkdir -p /boot/grub
	grub-mkconfig -o /boot/grub/grub.cfg

	# figure out the physical boot devices
	if mdadm --detail $root_device &>/dev/null; then
		boot_devices=$(mdadm --detail $root_device | grep 'active sync' | awk '{ print $7 }' | grep -o '/dev/sd.')
	else
		boot_devices=$(echo $root_device | grep -o '/dev/sd.')
	fi

	for device in ${boot_devices}; do
		einfo "Installing boot loader to ${device}"
		grub-install ${device}
	done
}

EXPORT_FUNCTIONS src_install pkg_config
