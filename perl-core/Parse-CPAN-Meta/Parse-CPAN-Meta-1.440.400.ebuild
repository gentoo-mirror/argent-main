# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=DAGOLDEN
MODULE_VERSION=1.4404
inherit perl-module

DESCRIPTION="Parse META.yml and other similar CPAN metadata files"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	>=virtual/perl-CPAN-Meta-YAML-0.8.0
	>=virtual/perl-JSON-PP-2.272.0
"
DEPEND="${RDEPEND}"

SRC_TEST=do
