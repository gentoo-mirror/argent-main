# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit eutils flag-o-matic libtool

DESCRIPTION="A library for manipulating FlashPIX images"
HOMEPAGE="http://www.i3a.org/"
SRC_URI="mirror://imagemagick/delegates/${P}-1.tar.bz2"

LICENSE="Flashpix"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.2.0.13-export-symbols.patch
	# we're not windows, even though we don't define __unix by default
	[[ ${CHOST} == *-darwin* ]] && append-flags -D__unix
	elibtoolize
}

src_configure() {
	append-ldflags -Wl,--no-undefined
	econf \
		--disable-dependency-tracking \
		LIBS="-lstdc++ -lm"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog doc/*.txt || die "dodoc failed"
	insinto /usr/share/doc/${PF}/pdf
	doins doc/*.pdf || die "doins failed"
}
