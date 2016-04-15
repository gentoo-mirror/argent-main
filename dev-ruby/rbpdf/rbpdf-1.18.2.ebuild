# Copyright 2014 Hacking Networked Solutions
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"
#RUBY_FAKEGEM_EXTRADOC="README.rdoc"

inherit ruby-fakegem

DESCRIPTION="Ruby on Rails TCPDF plugin"
HOMEPAGE="https://github.com/naitoh/rbpdf"
SRC_URI="https://github.com/naitoh/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

#ruby_add_rdepend "dev-ruby/actionpack"

ruby_add_bdepend "test? ( dev-ruby/combustion
	dev-ruby/rspec-rails )"
