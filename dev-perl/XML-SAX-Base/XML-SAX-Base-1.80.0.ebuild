# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=GRANTM
MODULE_VERSION=1.08
inherit perl-module eutils

DESCRIPTION="Base class SAX Drivers and Filters"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	!<dev-perl/XML-SAX-0.990.0
"
SRC_TEST="do"
