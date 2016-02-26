# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit unpacker

MAGIC="35198"

DESCRIPTION="Advanced cross-platform Google Drive client"
HOMEPAGE="https://www.insynchq.com/"
SRC_URI="amd64? ( http://s.insynchq.com/builds/insync_${PV}.${MAGIC}-trusty_amd64.deb )"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	unpack_deb insync_${PV}.${MAGIC}-trusty_amd64.deb
}

src_install() {
	mv "${S}"/* "${D}"/ || die
	dodir /etc/revdep-rebuild
	echo "SEARCH_DIRS_MASK=\"/usr/lib*/insync\"" > "${D}/etc/revdep-rebuild/70${PN}" || die
}
