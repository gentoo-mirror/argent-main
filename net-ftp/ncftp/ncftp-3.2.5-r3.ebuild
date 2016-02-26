# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit autotools eutils toolchain-funcs

DESCRIPTION="An extremely configurable ftp client"
HOMEPAGE="http://www.ncftp.com/"
SRC_URI="
	ftp://ftp.${PN}.com/${PN}/${P}-src.tar.bz2 -> ${P}.474.tar.bz2
	mirror://openbsd/distfiles/${P//.}-v6.diff.gz
"

LICENSE="Clarified-Artistic"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="ipv6 pch"

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${P/.474}

src_prepare() {
	epatch "${WORKDIR}"/${P//.}-v6.diff
	tc-export CC
	sed -i \
		-e "s:CC=gcc:CC ?= ${CC}:" \
		-e 's:@SFLAG@::' \
		-e 's:@STRIP@:true:' \
		Makefile.in */Makefile.in || die
	AT_M4DIR=autoconf_local/ eautoreconf
}

src_configure() {
	LC_ALL="C" \
	LIBS="$( $(tc-getPKG_CONFIG) --libs ncurses)" \
		econf \
		$(use_enable ipv6) \
		$(use_enable pch precomp) \
		--disable-ccdv \
		--disable-universal
}

src_install() {
	default
	dodoc README.txt doc/*.txt
	dohtml doc/html/*.html
}
