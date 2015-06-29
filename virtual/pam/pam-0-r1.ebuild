# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib-build

DESCRIPTION="Virtual for PAM (Pluggable Authentication Modules)"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="
	|| (
		>=sys-libs/pam-1.1.6-r2[${MULTILIB_USEDEP}]
		>=sys-auth/openpam-20120526-r1[${MULTILIB_USEDEP}]
	)"
