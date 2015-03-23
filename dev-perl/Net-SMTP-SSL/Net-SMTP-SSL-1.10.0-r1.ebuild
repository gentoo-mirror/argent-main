# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=CWEST
MODULE_VERSION=1.01
inherit perl-module

DESCRIPTION="SSL support for Net::SMTP"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="virtual/perl-libnet
	dev-perl/IO-Socket-SSL"
DEPEND="${RDEPEND}"

SRC_TEST="do"
