# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=SAPER
MODULE_VERSION=0.32
inherit perl-module

DESCRIPTION="Provides same functionality as BSD syslog"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# Tests disabled - they attempt to verify on the live system
#SRC_TEST="do"
