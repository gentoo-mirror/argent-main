# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_PN=${PN}.pm
MODULE_AUTHOR=MARKSTOS
MODULE_VERSION=3.63
inherit perl-module

DESCRIPTION="Simple Common Gateway Interface Class"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="
	test? (
		>=virtual/perl-Test-Simple-0.980.0
	)
"
#	dev-perl/FCGI" #236921

SRC_TEST="do"
