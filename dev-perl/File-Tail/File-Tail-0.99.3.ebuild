# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit perl-module

DESCRIPTION="Perl extension for reading from continously updated files"
SRC_URI="mirror://cpan/authors/id/M/MG/MGRABNAR/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/~mgrabnar/"

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="virtual/perl-Time-HiRes
	dev-lang/perl"

export OPTIMIZE="$CFLAGS"
mydoc="ToDo"
