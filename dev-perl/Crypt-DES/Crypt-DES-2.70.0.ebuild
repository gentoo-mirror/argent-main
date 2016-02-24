# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=DPARIS
MODULE_VERSION=2.07
inherit perl-module

DESCRIPTION="Crypt::DES module for perl"

LICENSE="DES"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

export OPTIMIZE="${CFLAGS}"
