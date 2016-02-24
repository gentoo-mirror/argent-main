# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1 flag-o-matic

MY_P="MySQL-python-${PV}"

DESCRIPTION="Python interface to MySQL"
HOMEPAGE="http://sourceforge.net/projects/mysql-python/ http://pypi.python.org/pypi/MySQL-python"
SRC_URI="mirror://sourceforge/mysql-python/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="virtual/mysql"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}"

DOCS=( HISTORY README doc/{FAQ,MySQLdb}.txt )

python_configure_all() {
	append-flags -fno-strict-aliasing
}
