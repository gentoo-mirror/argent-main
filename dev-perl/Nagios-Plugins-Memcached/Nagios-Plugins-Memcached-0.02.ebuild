# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

MODULE_AUTHOR="ZIGOROU"

inherit perl-module

DESCRIPTION="Nagios plugin to observe memcached."

LICENSE="|| ( Artistic GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-perl/Nagios-Plugin
	dev-perl/Cache-Memcached
	dev-perl/Carp-Clan
	dev-lang/perl"
RDEPEND="${DEPEND}"
