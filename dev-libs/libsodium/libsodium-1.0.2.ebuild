# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="A portable fork of NaCl, a higher-level cryptographic library"
HOMEPAGE="https://github.com/jedisct1/libsodium"
SRC_URI="http://download.libsodium.org/${PN}/releases/${P}.tar.gz"

LICENSE="ISC"
SLOT="0/13"
KEYWORDS="amd64 x86"
IUSE="+asm minimal static-libs +urandom"

src_configure() {
	local myconf

	# --disable-pie needed on x86, bug #512734
	use x86 && myconf="${myconf} --disable-pie"

	econf \
		$(use_enable asm) \
		$(use_enable minimal) \
		$(use_enable !urandom blocking-random) \
		$(use_enable static-libs static) \
		${myconf}
}

src_install() {
	default
	prune_libtool_files
}
