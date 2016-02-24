# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_TASK_DOC=""

inherit multilib ruby-fakegem

DESCRIPTION="Ruby C bindings to the Yajl JSON stream-based parser library"
HOMEPAGE="http://github.com/brianmario/yajl-ruby"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="${RDEPEND} dev-libs/yajl"
DEPEND="${DEPEND} dev-libs/yajl"

each_ruby_configure() {
	${RUBY} -Cext/yajl extconf.rb || die "extconf.rb failed"
}

each_ruby_compile() {
	emake -Cext/yajl CFLAGS="${CFLAGS} -fPIC" archflag="${LDFLAGS}" || die "make extension failed"
	cp ext/yajl/yajl$(get_modname) lib/yajl/ || die
}
