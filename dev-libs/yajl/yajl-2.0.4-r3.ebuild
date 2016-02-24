# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils cmake-multilib vcs-snapshot

DESCRIPTION="Small event-driven (SAX-style) JSON parser"
HOMEPAGE="http://lloyd.github.com/yajl/"
SRC_URI="http://github.com/lloyd/yajl/tarball/${PV} -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="static-libs"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-fix_static_linking.patch \
		"${FILESDIR}"/${P}-pkgconfig_multilib.patch

	multilib_copy_sources
}

src_test() {
	run_test() {
		cd "${BUILD_DIR}"/test
		./run_tests.sh ./yajl_test || die
	}
	multilib_parallel_foreach_abi run_test
}

src_install() {
	cmake-multilib_src_install

	use static-libs || \
		find "${D}" -name libyajl_s.a -delete
}
