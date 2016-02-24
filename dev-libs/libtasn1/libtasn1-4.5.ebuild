# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools-multilib

DESCRIPTION="ASN.1 library"
HOMEPAGE="http://www.gnu.org/software/libtasn1/"
SRC_URI="mirror://gnu/${PN}/${P}.tar.gz"

LICENSE="GPL-3 LGPL-2.1"
SLOT="0/6" # subslot = libtasn1 soname version
KEYWORDS="amd64 x86"
IUSE="doc static-libs"

DEPEND=">=dev-lang/perl-5.6
	sys-apps/help2man
	virtual/yacc"
RDEPEND="
	abi_x86_32? (
		!<=app-emulation/emul-linux-x86-baselibs-20131008-r16
		!app-emulation/emul-linux-x86-baselibs[-abi_x86_32(-)]
	)"

DOCS=( AUTHORS ChangeLog NEWS README THANKS )

src_configure() {
	local myeconfargs
	[[ "${VALGRIND_TESTS}" == "0" ]] && myeconfargs+=( --disable-valgrind-tests )
	autotools-multilib_src_configure
}

src_install() {
	autotools-multilib_src_install

	if use doc ; then
		dodoc doc/libtasn1.pdf
		dohtml doc/reference/html/*
	fi
}
