# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_PN=Pod-Parser
MODULE_AUTHOR=MAREKR
MODULE_VERSION=1.51
inherit perl-module

DESCRIPTION="Base class for creating POD filters and translators"
SRC_URI+=" http://dev.gentoo.org/~tove/distfiles/perl-core/PodParser/Pod-Parser-1.54-patch.tar.bz2"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

SRC_TEST="do"

EPATCH_SUFFIX=patch
PATCHES=(
	"${WORKDIR}"/${MY_PN:-${PN}}-patch
)
