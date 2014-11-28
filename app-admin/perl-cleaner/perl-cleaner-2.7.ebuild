# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="User land tool for cleaning up old perl installs"
HOMEPAGE="http://www.gentoo.org/proj/en/perl/"
SRC_URI="mirror://gentoo/${P}.tar.bz2
	http://dev.gentoo.org/~tove/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="app-shells/bash"
RDEPEND="${DEPEND}
	dev-lang/perl"

src_install() {
	dosbin perl-cleaner || die
	doman perl-cleaner.1 || die
}
