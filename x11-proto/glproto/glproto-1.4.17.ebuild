# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="X.Org GL protocol headers"
KEYWORDS="amd64"
LICENSE="SGI-B-2.0"
IUSE=""

RDEPEND=">=app-eselect/eselect-opengl-1.2.6"
DEPEND=""

src_install() {
	xorg-2_src_install
	dynamic_libgl_install
}

pkg_postinst() {
	xorg-2_pkg_postinst
	eselect opengl set --ignore-missing --use-old xorg-x11
}

dynamic_libgl_install() {
	# next section is to setup the dynamic libGL stuff
	ebegin "Moving GL files for dynamic switching"
		local gldir=/usr/$(get_libdir)/opengl/xorg-x11/include/GL
		dodir ${gldir}
		local x=""
		# glext.h added for #54984
		for x in "${ED}"/usr/include/GL/{glxtokens.h,glxmd.h,glxproto.h}; do
			if [[ -f ${x} || -L ${x} ]]; then
				mv -f "${x}" "${ED}"${gldir}
			fi
		done
	eend 0
}
