# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="Python 2 and 3 compatibility library"
HOMEPAGE="https://bitbucket.org/gutworth/six http://pypi.python.org/pypi/six"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc test"

DEPEND="doc? ( dev-python/sphinx )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )"

PATCHES=( "${FILESDIR}"/${PN}-1.5.2-mapping.patch )

python_compile_all() {
	use doc && emake -C documentation html
}

python_test() {
	py.test -v || die "Testing failed with ${EPYTHON}"
}

python_install_all() {
	use doc && local HTML_DOCS=( documentation/_build/html/ )
	distutils-r1_python_install_all
}
