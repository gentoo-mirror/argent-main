# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19 ruby20 jruby"

RUBY_FAKEGEM_TASK_DOC="docs"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="History.txt README.txt"

inherit ruby-fakegem

DESCRIPTION="Simplistic script which automates a limited set of rubyforge operations"
HOMEPAGE="http://codeforpeople.rubyforge.org/rubyforge/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

ruby_add_rdepend '>=dev-ruby/json-1.1.7'

ruby_add_bdepend "
	doc? ( dev-ruby/hoe )
	test? (
		virtual/ruby-ssl
		dev-ruby/hoe
	)"

all_ruby_prepare() {
	sed -i 's/json_pure/json/' "${WORKDIR}"/all/metadata || die "Unable to fix metadata."
}
