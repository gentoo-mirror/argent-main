# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=DAGOLDEN
MODULE_VERSION=2.120921
inherit perl-module

DESCRIPTION="The distribution metadata for a CPAN dist"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	>=virtual/perl-CPAN-Meta-Requirements-2.121.0
	>=virtual/perl-CPAN-Meta-YAML-0.8.0
	>=virtual/perl-JSON-PP-2.272.0
	>=virtual/perl-Parse-CPAN-Meta-1.440.300
	virtual/perl-Scalar-List-Utils
	>=virtual/perl-version-0.82
"
DEPEND="${RDEPEND}
	virtual/perl-File-Spec
	>=virtual/perl-File-Temp-0.20
	virtual/perl-IO
	>=virtual/perl-Test-Simple-0.88
	>=virtual/perl-ExtUtils-MakeMaker-6.56
"

SRC_TEST="do"
