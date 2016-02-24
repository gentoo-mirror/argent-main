# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit autotools eutils

MY_P=${PN}-${PV//./_}
DESCRIPTION="Implementation for atomic memory update operations"
HOMEPAGE="https://github.com/ivmai/libatomic_ops/"
SRC_URI="https://github.com/ivmai/${PN}/archive/${MY_P}.tar.gz"

LICENSE="MIT boehm-gc GPL-2+"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

S=${WORKDIR}/${PN}-${MY_P}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-7.4.0-docs.patch
	eautoreconf
}

src_configure() {
	econf --docdir="${EPREFIX}"/usr/share/doc/${PF}
}
