# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools

DESCRIPTION="A network protocol analyzer that produces logs in a customized way"
HOMEPAGE="http://justniffer.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${PN}/${PN}%20${PV}/${PN}_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">=dev-libs/boost-1.54.0 net-libs/libpcap"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
	cd lib/libnids-1.21_patched
	eautoreconf
}

src_configure() {
	CFLAGS= CXXFLAGS= LDFLAGS= econf
}
