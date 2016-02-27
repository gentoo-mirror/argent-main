# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=BINGOS
MODULE_VERSION=0.78
inherit perl-module

DESCRIPTION="Finding and running system commands made easy"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="virtual/perl-Locale-Maketext-Simple
	virtual/perl-Module-Load-Conditional
	>=virtual/perl-Params-Check-0.26"
RDEPEND="${DEPEND}"

SRC_TEST=do
