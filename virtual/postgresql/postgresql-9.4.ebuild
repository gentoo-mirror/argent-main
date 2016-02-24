# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Virtual package to ease the transition to unified PostgreSQL ebuilds"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="${PV}"
KEYWORDS="amd64 x86"
IUSE="kerberos ldap +server threads"

DEPEND="
	|| (
		(
			dev-db/postgresql-base:${SLOT}[kerberos=,ldap=,threads=]
			server? ( dev-db/postgresql-server:${SLOT} )
		)
		dev-db/postgresql:${SLOT}[kerberos=,ldap=,server=,threads=]
	)
"
RDEPEND="${DEPEND}"
