# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="Data files for poppler to support uncommon encodings without xpdfrc"
HOMEPAGE="http://poppler.freedesktop.org/"
SRC_URI="http://poppler.freedesktop.org/${P}.tar.gz"

LICENSE="BSD GPL-2 MIT"
KEYWORDS="amd64 x86"
SLOT="0"
IUSE=""

src_install() {
	emake prefix="${EPREFIX}"/usr DESTDIR="${D}" install || die

	# bug 409361
	dodir /usr/share/poppler/cMaps
	cd "${D}/${EPREFIX}"/usr/share/poppler/cMaps || die
	find ../cMap -type f -exec ln -s {} . \; || die
}
