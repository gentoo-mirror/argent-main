# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_P=${PN}-v${PV}
S=${WORKDIR}/${MY_P}
MODULE_AUTHOR=DTOWN
inherit perl-module

DESCRIPTION="A SNMP Perl Module"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	>=dev-perl/Crypt-DES-2.03
	>=virtual/perl-Digest-MD5-2.11
	>=dev-perl/Digest-SHA1-1.02
	>=dev-perl/Digest-HMAC-1.0
	>=virtual/perl-libnet-1.0703"
DEPEND="${RDEPEND}
	virtual/perl-Module-Build"

SRC_TEST=do
