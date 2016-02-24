# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib-build

DESCRIPTION="Virtual for OpenGL implementation"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	|| (
		media-libs/mesa[${MULTILIB_USEDEP}]
		media-libs/opengl-apple
	)"
DEPEND=""
