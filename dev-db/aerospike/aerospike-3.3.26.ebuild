# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit git-2 systemd unpacker python-single-r1

AMC_PV="3.4.5"

DESCRIPTION="Aerospike Database Server"
HOMEPAGE="https://github.com/aerospike/aerospike-server"
SRC_URI="http://www.aerospike.com/artifacts/aerospike-amc-community/${AMC_PV}/aerospike-amc-community-${AMC_PV}.all.x86_64.deb"

EGIT_REPO_URI="https://github.com/aerospike/aerospike-server.git"
EGIT_HAS_SUBMODULES=1
EGIT_COMMIT="${PV}"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-libs/openssl
	dev-lang/lua
	dev-python/greenlet[${PYTHON_USEDEP}]
	dev-python/setproctitle[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

src_unpack() {
	git-2_src_unpack
	unpacker "${DISTDIR}"/aerospike-amc-community-${AMC_PV}.all.x86_64.deb
	unpacker "${WORKDIR}"/opt/amc.tar.gz

}

src_prepare() {
	epatch "${FILESDIR}"/common-Makefile.patch
	epatch "${FILESDIR}"/mod-lua-Makefile.patch

	rm -f "${WORKDIR}"/amc/amc/bin/*.sh
	rm -f "${WORKDIR}"/amc/amc/bin/uninstall
	echo "${AMC_PV}" > "${WORKDIR}"/amc/amc/amc_version
	cp "${FILESDIR}"/gunicorn_config.py "${WORKDIR}"/amc/amc/config/gunicorn_config.py
}

src_compile() {
	emake DISTDIR="${D}" LD_CRYPTO=shared
}

src_install() {
	dobin target/Linux-x86_64/bin/asd

	insinto /usr/lib/aerospike/udf/lua
	doins modules/lua-core/src/*.lua

	insinto /usr/lib/aerospike/udf/lua/external
	doins modules/lua-core/src/external/*.lua

	insinto /usr/lib/aerospike/udf/lua/ldt
	doins modules/lua-core/src/ldt/*.lua

	keepdir /var/lib/aerospike/smd
	keepdir /var/lib/aerospike/udf/lua

	insinto /etc/aerospike
	doins "${FILESDIR}"/aerospike.conf

	systemd_dounit "${FILESDIR}"/aerospike.service

	insinto /opt/amc
	doins -r "${WORKDIR}"/amc/amc/*

	fperms +x /opt/amc/bin/gunicorn

	systemd_dounit "${FILESDIR}"/amc.service
}
