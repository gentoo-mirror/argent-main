# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=GAAS
MODULE_VERSION=6.02
inherit perl-module

DESCRIPTION="Media types and mailcap processing"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	!<dev-perl/libwww-perl-6
"
DEPEND="${RDEPEND}"

SRC_TEST=do
