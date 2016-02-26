# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# Kids, don't do this at home!
inherit python-utils-r1
PYTHON_COMPAT=( "${_PYTHON_ALL_IMPLS[@]}" )

inherit python-r1

DESCRIPTION="Compatibility package for dev-lang/python-exec"
HOMEPAGE="https://bitbucket.org/mgorny/python-exec/"
SRC_URI=""

LICENSE="BSD"
SLOT="2"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-lang/python-exec:0[${PYTHON_USEDEP}]
	dev-lang/python-exec:2[${PYTHON_USEDEP}]"
