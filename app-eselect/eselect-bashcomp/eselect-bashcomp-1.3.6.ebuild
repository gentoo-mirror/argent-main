# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Manage contributed bash-completion scripts"
HOMEPAGE="http://wiki.gentoo.org/wiki/Project:Eselect"
SRC_URI="mirror://gentoo/eselect-${PV}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64"

RDEPEND=">=app-eselect/eselect-1.3.8"

S="${WORKDIR}/eselect-${PV}"

src_prepare() {
	sed -i -e "/^MAINTAINER/aVERSION=\"${PV}\"" modules/bashcomp.eselect || die
}

src_configure() { :; }

src_compile() { :; }

src_install() {
	insinto /usr/share/eselect/modules
	doins modules/bashcomp.eselect
	doman man/bashcomp.eselect.5
}
