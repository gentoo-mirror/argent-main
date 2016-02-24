# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="X.Org Xdamage library"

KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="x11-libs/libX11[${MULTILIB_USEDEP}]
	x11-libs/libXfixes[${MULTILIB_USEDEP}]
	>=x11-proto/damageproto-1.1[${MULTILIB_USEDEP}]
	x11-proto/xproto[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}"
