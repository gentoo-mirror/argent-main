# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Some important notes about detecting libnet version
# http://dev.gentoo.org/~zlogene/perl-libnet-mantainer-notes

# perl-5.20 probably was 1.260 (which is not on cpan anymore)
# lets stabilize this one day together with dev-lang/perl-5.20

EAPI=5

DESCRIPTION="Virtual for ${PN#perl-}"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="~perl-core/${PN#perl-}-${PV}"
