# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="X.Org Xfixes library"

KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="x11-libs/libX11[${MULTILIB_USEDEP}]
	>=x11-proto/fixesproto-5[${MULTILIB_USEDEP}]
	x11-proto/xproto[${MULTILIB_USEDEP}]
	x11-proto/xextproto[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}"
