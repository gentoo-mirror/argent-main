# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Virtual for Fortran Compiler"
HOMEPAGE=""
SRC_URI=""

SLOT="0"
KEYWORDS="amd64 x86"
LICENSE=""
IUSE="openmp"

RDEPEND="
	|| (
		sys-devel/gcc[fortran,openmp?]
		sys-devel/gcc-apple[fortran,openmp?]
		dev-lang/ekopath
		dev-lang/ifc
		dev-lang/path64[openmp?]
		)"
DEPEND="${RDEPEND}"
