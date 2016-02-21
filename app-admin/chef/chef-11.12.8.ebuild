# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST="spec"

RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_GEMSPEC=${RUBY_FAKEGEM_NAME}.gemspec

inherit ruby-fakegem user

DESCRIPTION="Chef is a systems integration framework"
HOMEPAGE="http://wiki.opscode.com/display/chef"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

# specs have various indempotency issues which result in the global Chef::Config
# object to be replaced and subsequently fails other specs. Revisit this later.
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/chef-zero-2.0.2
	>=dev-ruby/diff-lcs-1.2.4
	>=dev-ruby/erubis-2.7
	>=dev-ruby/highline-1.6.9
	>=dev-ruby/json-1.4.4
	>=dev-ruby/mime-types-1.16
	>=dev-ruby/mixlib-authentication-1.3.0
	>=dev-ruby/mixlib-cli-1.4.0
	>=dev-ruby/mixlib-config-2.0
	>=dev-ruby/mixlib-log-1.3.0
	>=dev-ruby/mixlib-shellout-1.4
	>=dev-ruby/net-ssh-2.6
	>=dev-ruby/net-ssh-multi-1.1
	<dev-ruby/net-ssh-multi-1.2
	>=dev-ruby/ohai-7.0.4
	>=dev-ruby/rest-client-1.0.4
	<dev-ruby/rest-client-1.7
	dev-ruby/ruby-shadow
	>=dev-ruby/yajl-ruby-1.1
	<dev-ruby/yajl-ruby-2"

each_ruby_prepare() {
	ruby_fakegem_metadata_gemspec ../metadata ${RUBY_FAKEGEM_GEMSPEC}

	# json
	sed -i -e 's/"<= 1.8.1", //' ${RUBY_FAKEGEM_GEMSPEC} || die "Unable to fix up dependencies."
	# net-ssh
	sed -i -e 's/"~> 2.6", /">= 2.6, /' ${RUBY_FAKEGEM_GEMSPEC} || die "Unable to fix up dependencies."
}

all_ruby_install() {
	all_fakegem_install

	keepdir /etc/chef /var/lib/chef /var/log/chef

	insinto /etc/chef
	doins "${FILESDIR}/client.rb"
	doins "${FILESDIR}/solo.rb"

	doman distro/common/man/man1/*.1
	doman distro/common/man/man8/*.8
}

pkg_setup() {
	enewgroup chef
	enewuser chef -1 -1 /var/lib/chef chef
}
