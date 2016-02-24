# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=OLAF
MODULE_VERSION=0.66
inherit toolchain-funcs perl-module

DESCRIPTION="Perl Net::DNS - Perl DNS Resolver Module"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="ipv6 test"

RDEPEND="virtual/perl-Digest-MD5
	dev-perl/Digest-HMAC
	virtual/perl-Digest-SHA
	dev-perl/Net-IP
	ipv6? ( dev-perl/IO-Socket-INET6 )
	virtual/perl-MIME-Base64"
DEPEND="${RDEPEND}
	test? (
		virtual/perl-Test-Simple
		dev-perl/Test-Pod
	)"

PATCHES=( ${FILESDIR}/${PN}-0.64-ar.patch )
SRC_TEST="do"

src_prepare() {
	perl-module_src_prepare
	mydoc="TODO"
	if use ipv6 ; then
		myconf="--IPv6-tests"
	else
		myconf="--no-IPv6-tests"
	fi
	myconf="${myconf} --no-online-tests"
}

src_compile() {
	emake AR="$(tc-getAR)" OTHERLDFLAGS="${LDFLAGS}"
}
