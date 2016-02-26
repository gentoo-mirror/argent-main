# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2 systemd

DESCRIPTION="Aerospike C Client"
HOMEPAGE="https://github.com/aerospike/aerospike-client-c"

EGIT_REPO_URI="https://github.com/aerospike/aerospike-client-c.git"
EGIT_HAS_SUBMODULES=1
EGIT_COMMIT="${PV}"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-libs/openssl
	dev-lang/lua"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/common-Makefile.patch
	epatch "${FILESDIR}"/mod-lua-Makefile.patch
}

src_compile() {
	emake ROOT="${S}" -j1 modules-prepare all
}

src_install() {
	rm -rf target/Linux-x86_64/{src,obj}

	insinto /usr
	doins -r target/Linux-x86_64/*
}
