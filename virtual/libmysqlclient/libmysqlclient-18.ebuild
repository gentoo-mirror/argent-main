# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit multilib-build

DESCRIPTION="Virtual for MySQL client libraries"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0/18"
KEYWORDS="amd64 x86"
IUSE="static-libs"

DEPEND=""
RDEPEND="
	|| (
		dev-db/mysql-connector-c:${SLOT}[static-libs?,${MULTILIB_USEDEP}]
		dev-db/mariadb:${SLOT}[client-libs(+),static-libs?,${MULTILIB_USEDEP}]
		dev-db/mysql:${SLOT}[client-libs(+),static-libs?,${MULTILIB_USEDEP}]
		dev-db/percona-server:${SLOT}[client-libs(+),static-libs?,${MULTILIB_USEDEP}]
		dev-db/mariadb-galera:${SLOT}[client-libs(+),static-libs?,${MULTILIB_USEDEP}]
		dev-db/mysql-cluster:${SLOT}[client-libs(+),static-libs?,${MULTILIB_USEDEP}]
	)"
