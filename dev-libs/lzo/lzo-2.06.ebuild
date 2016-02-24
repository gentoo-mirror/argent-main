# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="An extremely fast compression and decompression library"
HOMEPAGE="http://www.oberhumer.com/opensource/lzo/"
SRC_URI="http://www.oberhumer.com/opensource/lzo/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="amd64 x86"
IUSE="examples static-libs"

src_configure() {
	econf \
		--docdir="${EPREFIX}"/usr/share/doc/${PF} \
		--enable-shared \
		$(use_enable static-libs static)
}

src_install() {
	emake DESTDIR="${D}" install

	dodoc BUGS ChangeLog README THANKS doc/*
	rm "${ED}"/usr/share/doc/${PF}/COPYING || die

	if use examples; then
		docinto examples
		dodoc examples/*.{c,h}
	fi

	find "${ED}" -name '*.la' -exec rm -f {} +
}
