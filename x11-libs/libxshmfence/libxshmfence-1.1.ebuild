# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="Shared memory fences using futexes"

KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="x11-proto/xproto[${MULTILIB_USEDEP}]
	${RDEPEND}"
