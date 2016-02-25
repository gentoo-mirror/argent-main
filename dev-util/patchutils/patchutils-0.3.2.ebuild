# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="A collection of tools that operate on patch files"
HOMEPAGE="http://cyberelk.net/tim/patchutils/"
SRC_URI="http://cyberelk.net/tim/data/patchutils/stable/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

RDEPEND=""
# The testsuite makes use of gendiff(1) that comes from rpm, thus if
# the user wants to run tests, it should install that too.
DEPEND="test? ( app-arch/rpm )"
