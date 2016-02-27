# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="2"

inherit python eutils

DESCRIPTION="Versatile replacement for vmstat, iostat and ifstat"
HOMEPAGE="http://dag.wieers.com/home-made/dstat/"
SRC_URI="http://dag.wieers.com/home-made/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="wifi"

RDEPEND="wifi? ( net-wireless/python-wifi )"
DEPEND=""

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_compile() {
	true
}

src_install() {
	emake DESTDIR="${ED}" install
	python_convert_shebangs 2 "${ED}usr/bin/dstat"

	dodoc \
		AUTHORS ChangeLog README TODO \
		examples/{mstat,read}.py docs/*.txt
	dohtml docs/*.html
}

pkg_postinst() {
	python_mod_optimize /usr/share/dstat
}

pkg_postrm() {
	python_mod_cleanup /usr/share/dstat
}
