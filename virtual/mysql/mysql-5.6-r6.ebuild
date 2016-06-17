# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit multilib-build

DESCRIPTION="Virtual for MySQL client or database"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0/18"
KEYWORDS="amd64 x86"
IUSE="embedded minimal static static-libs"

DEPEND=""
RDEPEND="=dev-db/mysql-${PV}*"
