# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit autotools eutils

DESCRIPTION="Toolkit for Internationalized Domain Names (IDN)"
HOMEPAGE="http://www.nic.ad.jp/ja/idn/idnkit/download/"
SRC_URI="http://www.nic.ad.jp/ja/idn/idnkit/download/sources/${P}-src.tar.gz"

LICENSE="JNIC"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="static-libs"

DEPEND="virtual/libiconv"

S=${WORKDIR}/${P}-src

src_prepare() {
	# Bug 263135, old broken libtool bundled
	rm -f aclocal.m4 || die "rm failed"
	epatch "${FILESDIR}/${P}-autotools.patch"
	mv configure.{in,ac} || die
	eautoreconf
}

src_configure() {
	local myconf=""
	if has_version dev-libs/libiconv; then
		myconf="--with-iconv"
	fi
	econf $(use_enable static-libs static) ${myconf}
}

src_install() {
	default
	use static-libs || find "${ED}" -name 'lib*.la' -delete
	dodoc ChangeLog DISTFILES NEWS README README.ja
}
