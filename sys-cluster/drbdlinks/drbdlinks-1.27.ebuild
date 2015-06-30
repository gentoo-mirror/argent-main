# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A python script to manage symlinks in a Linux-HA cluster environment using DRBD"
HOMEPAGE="http://www.tummy.com/Community/software/drbdlinks"
SRC_URI="ftp://ftp.tummy.com/pub/tummy/drbdlinks/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="heartbeat"

DEPEND="dev-lang/python
	heartbeat? ( sys-cluster/heartbeat )"

src_install () {
	dosbin drbdlinks 

	insinto /etc
	doins drbdlinks.conf

	newinitd "${FILESDIR}"/drbdlinks-init drbdlinks

	doman drbdlinks.8 
	dodoc LICENSE README WHATSNEW

	if useq heartbeat; then
		dodir /etc/ha.d/resource.d
		dosym /usr/sbin/drbdlinks /etc/ha.d/resource.d/drbdlinks
	fi
}

pkg_postinst() {
	einfo
	einfo "Please modify /etc/drbdlinks.conf as needed."
	einfo
}
