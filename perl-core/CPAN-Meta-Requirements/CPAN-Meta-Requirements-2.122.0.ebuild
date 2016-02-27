# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=DAGOLDEN
MODULE_VERSION=2.122
inherit perl-module

DESCRIPTION="A set of version requirements for a CPAN dist"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	virtual/perl-Scalar-List-Utils
	>=virtual/perl-version-0.77
	!<perl-core/CPAN-Meta-2.120.920
"
DEPEND="${RDEPEND}
"

SRC_TEST="do"
