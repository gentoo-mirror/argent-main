# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_P="eselect-emacs-${PV}"
DESCRIPTION="Manages ctags implementations"
HOMEPAGE="http://wiki.gentoo.org/wiki/Project:Emacs"
SRC_URI="http://dev.gentoo.org/~ulm/emacs/${MY_P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=">=app-admin/eselect-1.2.3"

S="${WORKDIR}/${MY_P}"

src_compile() { :; }

src_install() {
	insinto /usr/share/eselect/modules
	doins ctags.eselect
	doman ctags.eselect.5
}
