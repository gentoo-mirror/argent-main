# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=MARKOV
MODULE_VERSION=2.12
inherit perl-module

DESCRIPTION="Manipulation of electronic mail addresses"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	>=virtual/perl-libnet-1.70.300
	dev-perl/TimeDate
"
DEPEND="${RDEPEND}"

SRC_TEST="do"
