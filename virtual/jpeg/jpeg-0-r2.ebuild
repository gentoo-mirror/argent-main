# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib-build

DESCRIPTION="A virtual for selecting between libjpeg-turbo and IJG jpeg for source-based packages"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="static-libs"

RDEPEND="|| (
		>=media-libs/libjpeg-turbo-1.3.0-r3:0[static-libs?,${MULTILIB_USEDEP}]
		>=media-libs/jpeg-8d-r1:0[static-libs?,${MULTILIB_USEDEP}]
		)"
DEPEND=""
