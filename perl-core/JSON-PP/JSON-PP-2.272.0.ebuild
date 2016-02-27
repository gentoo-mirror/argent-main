# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=MAKAMAKA
MODULE_VERSION=2.27200
inherit perl-module

DESCRIPTION="JSON::XS compatible pure-Perl module"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="!!<dev-perl/JSON-2.50"

SRC_TEST="do"
