# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19 ruby20 jruby"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="History.rdoc README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Provides a mailcap-like MIME Content-Type lookup for Ruby."
HOMEPAGE="http://rubyforge.org/projects/mime-types"

LICENSE="MIT Artistic GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

ruby_add_bdepend "test? ( virtual/ruby-minitest )"

each_ruby_test() {
	${RUBY} -Ilib -S testrb test/test_*.rb || die
}
