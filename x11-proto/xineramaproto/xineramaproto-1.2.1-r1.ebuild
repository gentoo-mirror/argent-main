# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="X.Org Xinerama protocol headers"

KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="!<x11-libs/libXinerama-1.0.99.1"
DEPEND="${RDEPEND}"
