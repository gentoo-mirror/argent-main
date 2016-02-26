# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=CAPTTOFU
MODULE_VERSION=4.032
inherit eutils perl-module

DESCRIPTION="The Perl DBD:mysql Module"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="embedded test"

RDEPEND="dev-perl/DBI
	dev-perl/Test-Deep
	virtual/mysql[embedded?]"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-print_embedded_options.patch
}

src_configure() {
	if use test; then
		myconf="${myconf} --testdb=test \
			--testhost=localhost \
			--testuser=test \
			--testpassword=test"
	fi
	use embedded && myconf="${myconf} --force-embedded --embedded=mysql_config"
	perl-module_src_configure
}

src_test() {
	einfo
	einfo "If tests fail, you have to configure your MySQL instance to create"
	einfo "and grant some privileges to the test user."
	einfo "You can run the following commands at the MySQL prompt: "
	einfo "> CREATE USER 'test'@'localhost' IDENTIFIED BY 'test';"
	einfo "> CREATE DATABASE test;"
	einfo "> GRANT ALL PRIVILEGES ON test.* TO 'test'@'localhost';"
	einfo
	sleep 5
	perl-module_src_test
}
