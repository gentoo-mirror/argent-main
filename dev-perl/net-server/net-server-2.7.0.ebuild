# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_PN=Net-Server
MODULE_AUTHOR=RHANDOM
MODULE_VERSION=2.007
inherit perl-module eutils

DESCRIPTION="Extensible, general Perl server engine"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="ipv6"

RDEPEND="dev-perl/IO-Multiplex
	ipv6? ( dev-perl/IO-Socket-INET6 )"
DEPEND="${RDEPEND}"

SRC_TEST="do"
