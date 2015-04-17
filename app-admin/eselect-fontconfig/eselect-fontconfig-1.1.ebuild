# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="An eselect module to manage /etc/fonts/conf.d symlinks."
HOMEPAGE="http://www.gentoo.org"
SRC_URI="mirror://gentoo/fontconfig.eselect-${PV}.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=">=app-eselect-eselect-1.2.3
		 >=media-libs/fontconfig-2.4"

S=${WORKDIR}

src_install() {
	insinto /usr/share/eselect/modules
	newins "${S}"/fontconfig.eselect-${PV} fontconfig.eselect || die
}
