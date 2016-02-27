# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="wrapper for automake to manage multiple automake versions"
HOMEPAGE="http://www.gentoo.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

S=${WORKDIR}

src_unpack() {
	cp "${FILESDIR}"/am-wrapper-${PV}.sh "${S}"/
	# usr/bin/aclocal: bad substitution -> /bin/sh != POSIX shell
	if use prefix ; then
		sed -i -e '1c\#!'"${EPREFIX}"'/bin/sh' "${S}"/am-wrapper-${PV}.sh || die
	fi
}

src_install() {
	newbin "${S}"/am-wrapper-${PV}.sh automake || die
	dosym automake /usr/bin/aclocal

	keepdir /usr/share/aclocal
}
