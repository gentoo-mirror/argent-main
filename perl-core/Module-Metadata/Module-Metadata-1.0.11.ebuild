# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=APEIRON
MODULE_VERSION=1.000011
inherit perl-module

DESCRIPTION="Gather package and POD information from perl module files"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=virtual/perl-version-0.870"
DEPEND="${RDEPEND}"

SRC_TEST="do"
