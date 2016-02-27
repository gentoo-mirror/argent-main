# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="manage ssh and GPG keys in a convenient and secure manner. Frontend for ssh-agent/ssh-add"
HOMEPAGE="http://www.funtoo.org/wiki/Keychain"
SRC_URI="http://www.funtoo.org/archive/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="app-shells/bash
	virtual/ssh"

src_compile() { :; }

src_install() {
	dobin ${PN}
	doman ${PN}.1
	dodoc ChangeLog README.rst
}
