# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=TODDR
MODULE_VERSION=2.41
inherit perl-module multilib

DESCRIPTION="A Perl extension interface to James Clark's XML parser, expat"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=">=dev-libs/expat-1.95.1-r1"
DEPEND="${RDEPEND}"

SRC_TEST=do
myconf="EXPATLIBPATH=${EPREFIX}/usr/$(get_libdir) EXPATINCPATH=${EPREFIX}/usr/include"
