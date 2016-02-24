# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit multilib

DESCRIPTION="Shared Memory Abstraction Library"
HOMEPAGE="http://www.ossp.org/pkg/lib/mm/"
SRC_URI="ftp://ftp.ossp.org/pkg/lib/mm/${P}.tar.gz"

LICENSE="mm"
SLOT="1.2"
KEYWORDS="amd64 x86"
IUSE=""

src_prepare() {
	sed -i Makefile.in \
		-e '/--mode=link/s| -o | $(LDFLAGS)&|g' \
		|| die "sed Makefile.in"
}

src_test() {
	emake test || die "testing problem"
}

src_install() {
	emake install DESTDIR="${D}" || die
	dodoc README ChangeLog INSTALL PORTING THANKS
}

pkg_postinst() {
	ewarn 'if you upgraded from mm-1.3 or earlier please run:'
	ewarn "revdep-rebuild --library \"/usr/$(get_libdir)/libmm.so.13\""
}
