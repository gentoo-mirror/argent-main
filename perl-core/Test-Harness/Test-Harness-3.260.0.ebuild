# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=OVID
MODULE_VERSION=3.26
inherit perl-module

DESCRIPTION="Runs perl standard test scripts with statistics"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

PREFER_BUILDPL=no
SRC_TEST="do"
mydoc="rfc*.txt"
