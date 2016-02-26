# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit autotools

DESCRIPTION="Multiple Image Networkgraphics lib (animated png's)"
HOMEPAGE="http://www.libmng.com/"
SRC_URI="mirror://sourceforge/libmng/${P}.tar.gz"

LICENSE="libmng"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="lcms static-libs"

RDEPEND="virtual/jpeg:0
	>=sys-libs/zlib-1.1.4
	lcms? ( =media-libs/lcms-1* )"
DEPEND="${RDEPEND}"

src_prepare() {
	ln -s makefiles/configure.in .
	ln -s makefiles/Makefile.am .
	sed -i '/^AM_C_PROTOTYPES$/d' configure.in || die #420223

	eautoreconf
}

src_configure() {
	econf \
		--disable-dependency-tracking \
		$(use_enable static-libs static) \
		--with-jpeg \
		$(use_with lcms)
}

src_install() {
	emake DESTDIR="${D}" install || die

	use static-libs || find "${ED}" -name '*.la' -exec rm -f {} +

	dodoc CHANGES README*
	dodoc doc/doc.readme doc/libmng.txt
	doman doc/man/*
}
