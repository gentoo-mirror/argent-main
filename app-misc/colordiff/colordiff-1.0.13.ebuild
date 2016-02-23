# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit prefix

DESCRIPTION="Colorizes output of diff"
HOMEPAGE="http://www.colordiff.org/"
SRC_URI="http://www.colordiff.org/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	dev-lang/perl
	sys-apps/diffutils"

src_prepare() {
	# set proper etcdir for Gentoo Prefix
	sed \
		-e "s:'/etc:'@GENTOO_PORTAGE_EPREFIX@/etc:" \
		-i "${S}/colordiff.pl" || die "sed etcdir failed"
	eprefixify "${S}"/colordiff.pl
}

# This package has a makefile, but we don't want to run it
src_compile() { :; }

src_install() {
	newbin ${PN}{.pl,}
	newbin cdiff.sh cdiff
	insinto /etc
	doins colordiffrc colordiffrc-lightbg
	dodoc BUGS CHANGES README
	doman {cdiff,colordiff}.1
}
