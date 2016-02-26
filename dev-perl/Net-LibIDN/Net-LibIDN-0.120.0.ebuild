# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=THOR
MODULE_VERSION=0.12
inherit perl-module

DESCRIPTION="Perl bindings for GNU Libidn"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="net-dns/libidn"
RDEPEND="${DEPEND}"

SRC_TEST=do
