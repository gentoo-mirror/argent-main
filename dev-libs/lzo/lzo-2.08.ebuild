# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils multilib-minimal

DESCRIPTION="An extremely fast compression and decompression library"
HOMEPAGE="http://www.oberhumer.com/opensource/lzo/"
SRC_URI="http://www.oberhumer.com/opensource/lzo/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="2"
KEYWORDS="amd64"
IUSE="examples static-libs"

RDEPEND="abi_x86_32? (
		!<=app-emulation/emul-linux-x86-baselibs-20131008-r19
		!app-emulation/emul-linux-x86-baselibs[-abi_x86_32]
	)"

DOCS="BUGS ChangeLog README THANKS doc/*"

multilib_src_configure() {
	ECONF_SOURCE=${S} \
	econf \
		--docdir="${EPREFIX}"/usr/share/doc/${PF} \
		--enable-shared \
		$(use_enable static-libs static)
}

multilib_src_install_all() {
	einstalldocs
	rm -f "${ED}"/usr/share/doc/${PF}/COPYING

	if use examples; then
		docinto examples
		dodoc examples/*.{c,h}
	fi

	prune_libtool_files
}
