# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# Unconditional dependency of gcc.  Keep this set to 0.
EAPI="0"

inherit eutils libtool multilib

DESCRIPTION="A library for multiprecision complex arithmetic with exact rounding"
HOMEPAGE="http://mpc.multiprecision.org/"
SRC_URI="http://www.multiprecision.org/mpc/download/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64"
IUSE="static-libs"

DEPEND=">=dev-libs/gmp-4.3.2
	>=dev-libs/mpfr-2.4.2"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	elibtoolize # for FreeMiNT, bug #347317
}

src_compile() {
	econf $(use_enable static-libs static) || die
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	use static-libs || rm "${ED:-${D}}"/usr/lib*/libmpc.la
	dodoc ChangeLog NEWS README TODO
}

pkg_preinst() {
	preserve_old_lib /usr/$(get_libdir)/libmpc.so.2
}

pkg_postinst() {
	preserve_old_lib_notify /usr/$(get_libdir)/libmpc.so.2
}
