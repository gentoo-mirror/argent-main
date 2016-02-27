# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=PMQS
MODULE_VERSION=2.060
inherit multilib perl-module

DESCRIPTION="Low-Level Interface to zlib compression library"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=sys-libs/zlib-1.2.5"
DEPEND="${RDEPEND}"
#	test? ( dev-perl/Test-Pod )"

SRC_TEST=parallel

src_prepare() {
	rm -rf "${S}"/zlib-src/ || die
	sed -i '/^zlib-src/d' "${S}"/MANIFEST || die
	perl-module_src_prepare
}

src_configure() {
	BUILD_ZLIB=False \
	ZLIB_INCLUDE="${EPREFIX}"/usr/include \
	ZLIB_LIB="${EPREFIX}"/usr/$(get_libdir) \
		perl-module_src_configure
}
