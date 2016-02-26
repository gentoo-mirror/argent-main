# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=PERIGRIN
MODULE_VERSION=0.53
inherit perl-module

DESCRIPTION="SAX2 Writer"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-perl/XML-Filter-BufferText
	dev-perl/XML-SAX
	>=dev-perl/XML-NamespaceSupport-1.04
	>=dev-libs/libxml2-2.4.1"
DEPEND="${RDEPEND}"

SRC_TEST="do"
