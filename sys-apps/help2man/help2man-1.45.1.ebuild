# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

DESCRIPTION="GNU utility to convert program --help output to a man page"
HOMEPAGE="http://www.gnu.org/software/help2man/"
SRC_URI="mirror://gnu/${PN}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE="nls elibc_glibc"

RDEPEND="dev-lang/perl
	elibc_glibc? ( nls? (
		dev-perl/Locale-gettext
	) )"
DEPEND=${RDEPEND}

DOCS="debian/changelog NEWS README THANKS" #385753

src_prepare() {
	epatch \
		"${FILESDIR}"/${PN}-1.36.4-respect-LDFLAGS.patch \
		"${FILESDIR}"/${PN}-1.38.4-linguas.patch
}

src_configure() {
	local myconf
	use elibc_glibc \
		&& myconf="${myconf} $(use_enable nls)" \
		|| myconf="${myconf} --disable-nls"
	econf ${myconf}
}
