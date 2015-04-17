# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Utility to change the Mesa OpenGL driver being used"
HOMEPAGE="http://www.gentoo.org/"

SRC_URI="mirror://gentoo/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=">=app-eselect-eselect-1.2.4
	>=app-shells/bash-4"

src_install() {
	insinto /usr/share/eselect/modules
	doins mesa.eselect || die
}

pkg_postinst() {
	if has_version ">=media-libs/mesa-7.9" && \
		! [ -f "${EROOT}"/usr/share/mesa/eselect-mesa.conf ]; then
		eerror "Rebuild media-libs/mesa for ${PN} to work."
	fi
}
