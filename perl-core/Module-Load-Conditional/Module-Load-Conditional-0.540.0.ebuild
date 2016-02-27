# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=BINGOS
MODULE_VERSION=0.54
inherit perl-module

DESCRIPTION="Looking up module information / loading at runtime"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	>=virtual/perl-Module-Load-0.12
	>=virtual/perl-Module-CoreList-0.22
	>=virtual/perl-Module-Metadata-1.0.5
	virtual/perl-Locale-Maketext-Simple
	virtual/perl-Params-Check
	virtual/perl-version
"
DEPEND="${RDEPEND}"

SRC_TEST=do
