# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit multilib-build

DESCRIPTION="Virtual for libudev providers"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0/1"
KEYWORDS="amd64"
IUSE="static-libs systemd"

DEPEND=""
RDEPEND="
	systemd? ( || (
		>=sys-apps/systemd-212-r5:0/2[${MULTILIB_USEDEP}]
		>=sys-apps/systemd-208-r3:0/1[${MULTILIB_USEDEP}]
		>=sys-apps/systemd-208:0/0[${MULTILIB_USEDEP}] )
	)"

REQUIRED_USE="systemd? ( !static-libs )"
