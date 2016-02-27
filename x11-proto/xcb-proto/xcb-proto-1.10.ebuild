# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )
XORG_MULTILIB=yes

inherit python-r1 xorg-2

DESCRIPTION="X C-language Bindings protocol headers"
HOMEPAGE="http://xcb.freedesktop.org/"
EGIT_REPO_URI="git://anongit.freedesktop.org/git/xcb/proto"
[[ ${PV} != 9999* ]] && \
	SRC_URI="http://xcb.freedesktop.org/dist/${P}.tar.bz2"

KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
	dev-libs/libxml2"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_configure() {
	python_export_best
	xorg-2_src_configure
	#Note: multilib is not supported with python, therefore use only one ABI
	python_parallel_foreach_impl autotools-utils_src_configure
}

src_compile() {
	xorg-2_src_compile

	python_foreach_impl autotools-utils_src_compile -C xcbgen \
		top_builddir="${WORKDIR}/${P}-${ABI:-${DEFAULT_ABI}}"
}

src_install() {
	xorg-2_src_install

	python_foreach_impl autotools-utils_src_install -C xcbgen \
		top_builddir="${WORKDIR}/${P}-${ABI:-${DEFAULT_ABI}}"

	# pkg-config file hardcodes python sitedir, bug 486512
	sed -i -e '/pythondir/s:=.*$:=/dev/null:' \
		"${ED}"/usr/lib*/pkgconfig/xcb-proto.pc || die
}
