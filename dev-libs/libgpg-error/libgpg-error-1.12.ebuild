# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit libtool

DESCRIPTION="Contains error handling functions used by GnuPG software"
HOMEPAGE="http://www.gnupg.org/related_software/libgpg-error"
SRC_URI="mirror://gnupg/${PN}/${P}.tar.bz2"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="common-lisp nls static-libs"

RDEPEND="nls? ( virtual/libintl )"
DEPEND="nls? ( sys-devel/gettext )"

src_prepare() {
	elibtoolize
}

src_configure() {
	econf \
		$(use_enable nls) \
		$(use_enable static-libs static) \
		$(use_enable common-lisp languages)
}

src_install() {
	default

	# library has no dependencies, so it does not need the .la file
	find "${D}" -name '*.la' -delete
}
