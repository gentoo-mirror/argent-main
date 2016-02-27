# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

if [[ ${PV} = 9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/gentoo/${PN}.git"
else
	SRC_URI="http://dev.gentoo.org/~williamh/dist/${P}.tar.bz2
	prefix? ( http://dev.gentoo.org/~grobian/distfiles/consoletype-1.0.sh )"
	KEYWORDS="amd64 x86"
fi

inherit toolchain-funcs

DESCRIPTION="base functions required by all gentoo systems"
HOMEPAGE="http://www.gentoo.org"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

src_prepare() {
	tc-export CC

	# in prefix, use shell script, for the C-code doesn't compile
	use prefix && cp "${DISTDIR}"/consoletype-1.0.sh consoletype
}

src_install() {
	emake install DESTDIR="${ED}"
}
