# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools-utils eutils libtool

MY_P="${P/lib}"

DESCRIPTION="YAML 1.1 parser and emitter written in C"
HOMEPAGE="http://pyyaml.org/wiki/LibYAML"
SRC_URI="http://pyyaml.org/download/${PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc examples test static-libs"

S="${WORKDIR}/${MY_P}"

DOCS="README"

src_prepare() {
	# conditionally remove tests
	if ! use test; then
		sed -i -e 's: tests::g' Makefile* || die
	fi
	elibtoolize  # for FreeMiNT
}

src_install() {
	autotools-utils_src_install
	use doc && dohtml -r doc/html/.
	if use examples ; then
		docompress -x /usr/share/doc/${PF}/examples
		insinto /usr/share/doc/${PF}/examples
		doins tests/example-*.c
	fi
}
