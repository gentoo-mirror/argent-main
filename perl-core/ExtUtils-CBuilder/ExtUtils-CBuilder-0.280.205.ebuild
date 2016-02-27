# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=DAGOLDEN
MODULE_VERSION=0.280205
inherit perl-module

DESCRIPTION="Compile and link C code for Perl modules"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	virtual/perl-File-Spec
	virtual/perl-File-Temp
	virtual/perl-IPC-Cmd
	virtual/perl-Perl-OSType
"
DEPEND="${RDEPEND}"

SRC_TEST="parallel"
