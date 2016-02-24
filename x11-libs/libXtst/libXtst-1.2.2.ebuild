# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

XORG_DOC="doc"
XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="X.Org Xlib-based client API for the XTEST & RECORD extensions library"

KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="x11-libs/libX11[${MULTILIB_USEDEP}]
	>=x11-libs/libXext-1.0.99.4[${MULTILIB_USEDEP}]
	x11-libs/libXi[${MULTILIB_USEDEP}]
	>=x11-proto/recordproto-1.13.99.1[${MULTILIB_USEDEP}]
	>=x11-proto/xextproto-7.0.99.3[${MULTILIB_USEDEP}]
	x11-proto/inputproto[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}"
