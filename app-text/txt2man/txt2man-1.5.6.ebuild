# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="Scripts to convert regular ASCII text to man pages"
HOMEPAGE="http://mvertes.free.fr/"
SRC_URI="http://mvertes.free.fr/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="app-shells/bash
	sys-apps/gawk"

src_compile() { :; }

src_install() {
	dobin bookman src2man txt2man
	doman *.1
	dodoc Changelog README
}
