# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

TEXLIVE_MODULE_CONTENTS="texlive-common texlive-docindex texlive-en collection-documentation-base
"
TEXLIVE_MODULE_DOC_CONTENTS="texlive-common.doc texlive-docindex.doc texlive-en.doc "
TEXLIVE_MODULE_SRC_CONTENTS=""
inherit  texlive-module
DESCRIPTION="TeXLive TeX Live documentation"

LICENSE="GPL-2 "
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND} "
