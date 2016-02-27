# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit autotools eutils

DESCRIPTION="A system-independent library for user-level network packet capture"
HOMEPAGE="http://www.tcpdump.org/"
SRC_URI="http://www.tcpdump.org/release/${P}.tar.gz
	http://www.jp.tcpdump.org/release/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="bluetooth ipv6 netlink static-libs canusb"

RDEPEND="bluetooth? ( net-wireless/bluez )
	netlink? ( dev-libs/libnl:1.1 )
	canusb? ( virtual/libusb )"
DEPEND="${RDEPEND}
	sys-devel/flex
	virtual/yacc"

DOCS=( CREDITS CHANGES VERSION TODO README{,.dag,.linux,.macosx,.septel} )

src_prepare() {
	epatch \
		"${FILESDIR}"/${PN}-1.2.0-cross-linux.patch \
		"${FILESDIR}"/${PN}-1.3.0-canusb.patch \
		"${FILESDIR}"/${P}-fix-systems-without-ipv6-support.patch
	# Prefix' Solaris uses GNU ld
	sed -i -e 's/freebsd\*/freebsd*|solaris*/' \
		-e 's/sparc64\*/sparc64*|sparcv9*/'  aclocal.m4 || die
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable bluetooth) \
		$(use_enable ipv6) \
		$(use_enable canusb) \
		$(use_with netlink libnl)
}

src_compile() {
	emake all shared
}

src_install() {
	default

	# remove static libraries (--disable-static does not work)
	if ! use static-libs; then
		find "${ED}" -name '*.a' -exec rm {} + || die
	fi

	# We need this to build pppd on G/FBSD systems
	if [[ "${USERLAND}" == "BSD" ]]; then
		insinto /usr/include
		doins pcap-int.h
	fi
}
