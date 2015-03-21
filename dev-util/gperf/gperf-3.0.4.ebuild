# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit toolchain-funcs

DESCRIPTION="A perfect hash function generator"
HOMEPAGE="http://www.gnu.org/software/gperf/gperf.html"
SRC_URI="mirror://gnu/gperf/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

src_prepare() {
	sed -i \
		-e "/^AR /s:=.*:= $(tc-getAR):" \
		-e "/^CPPFLAGS /s:=:+=:" \
		*/Makefile.in || die #444078
}

src_configure() {
	econf --htmldir='$(datarootdir)/doc/'"${PF}/html"
}
