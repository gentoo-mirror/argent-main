# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit base cmake-utils

DESCRIPTION="Small event-driven (SAX-style) JSON parser"
HOMEPAGE="http://lloyd.github.com/yajl/"
SRC_URI="http://github.com/lloyd/yajl/tarball/${PV} -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

PATCHES=(
	"${FILESDIR}"/${PN}-fix_static_linking.patch
)

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}"/lloyd-${PN}-* "${S}"
}

src_test() {
	emake -C "${CMAKE_BUILD_DIR}" test
}

src_install() {
	cmake-utils_src_install
}
