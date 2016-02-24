# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

XORG_DOC=doc
XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="X.Org Xi library"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=x11-libs/libX11-1.4.99.1[${MULTILIB_USEDEP}]
	>=x11-libs/libXext-1.1[${MULTILIB_USEDEP}]
	>=x11-libs/libXfixes-5[${MULTILIB_USEDEP}]
	>=x11-proto/inputproto-2.2.99.1[${MULTILIB_USEDEP}]
	>=x11-proto/xproto-7.0.13[${MULTILIB_USEDEP}]
	>=x11-proto/xextproto-7.0.3[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}"

src_configure() {
	XORG_CONFIGURE_OPTIONS=(
		$(use_enable doc specs)
		$(use_with doc xmlto)
		$(use_with doc asciidoc)
		--without-fop
	)
	xorg-2_src_configure
}

pkg_postinst() {
	xorg-2_pkg_postinst

	ewarn "Some special keys and keyboard layouts may stop working."
	ewarn "To fix them, recompile xorg-server."
}
