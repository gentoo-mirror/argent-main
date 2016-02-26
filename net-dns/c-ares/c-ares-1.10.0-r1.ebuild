# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils multilib-minimal

DESCRIPTION="C library that resolves names asynchronously"
HOMEPAGE="http://c-ares.haxx.se/"
SRC_URI="http://${PN}.haxx.se/download/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="static-libs"

DOCS=( AUTHORS CHANGES NEWS README RELEASE-NOTES TODO )

MULTILIB_WRAPPED_HEADERS=(
	/usr/include/ares_build.h
)

multilib_src_configure() {
	ECONF_SOURCE=${S} \
	econf \
		--enable-nonblocking \
		--enable-symbol-hiding \
		$(use_enable static-libs static)
}

multilib_src_install_all() {
	einstalldocs
	prune_libtool_files --all
}
