# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Interactive adduser script from Slackware"
HOMEPAGE="http://www.interlude.org.uk/unix/slackware/"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="sys-apps/shadow"

src_install() {
	dosbin "${FILESDIR}"/${PV}/superadduser || die
	doman "${FILESDIR}"/superadduser.8
}
