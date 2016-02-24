# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils vim-plugin

DESCRIPTION="vim plugin: Eselect syntax highlighting, filetype and indent settings"
HOMEPAGE="http://www.gentoo.org/"
SRC_URI="mirror://gentoo/${P}.tar.bz2"

LICENSE="vim"
KEYWORDS="amd64 x86"

DEPEND="!<app-vim/gentoo-syntax-20070506"
RDEPEND="${DEPEND}"

IUSE=""

VIM_PLUGIN_HELPFILES="${PN}"
VIM_PLUGIN_MESSAGES="filetype"
