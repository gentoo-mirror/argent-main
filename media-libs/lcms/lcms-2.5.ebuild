# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
AUTOTOOLS_PRUNE_LIBTOOL_FILES="modules"
inherit autotools-utils

DESCRIPTION="A lightweight, speed optimized color management engine"
HOMEPAGE="http://www.littlecms.com/"
SRC_URI="mirror://sourceforge/${PN}/lcms2-${PV}.tar.gz"

LICENSE="MIT"
SLOT="2"
KEYWORDS="amd64 x86"
IUSE="doc jpeg static-libs test tiff zlib"

RDEPEND="jpeg? ( virtual/jpeg:0 )
	tiff? ( media-libs/tiff:0= )
	zlib? ( sys-libs/zlib:= )"
DEPEND="${RDEPEND}"

S=${WORKDIR}/lcms2-${PV}

src_configure() {
	local myeconfargs=(
		$(use_with jpeg)
		$(use_with tiff)
		$(use_with zlib)
	)
	autotools-utils_src_configure
}

src_install() {
	autotools-utils_src_install

	if use doc; then
		docinto pdf
		dodoc doc/*.pdf
	fi
}
