# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=PMQS
MODULE_VERSION=1.827
inherit perl-module multilib eutils

DESCRIPTION="A Berkeley DB Support Perl Module"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="sys-libs/db"
DEPEND="${RDEPEND}"

SRC_TEST="do"

src_prepare() {
	if [[ $(get_libdir) != "lib" ]] ; then
		sed -i "s:^LIB.*:LIB = /usr/$(get_libdir):" "${S}"/config.in || die
	fi
	epatch "${FILESDIR}"/DB_File-MakeMaker.patch
}
