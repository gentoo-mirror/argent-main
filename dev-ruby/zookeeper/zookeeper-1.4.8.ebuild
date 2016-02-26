# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRADOC="README.markdown"

inherit ruby-fakegem

DESCRIPTION="A low-level multi-Ruby wrapper around the ZooKeeper API bindings"
HOMEPAGE="https://github.com/slyphon/zookeeper"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

each_ruby_configure() {
	sed -i -e 's/\$LIBS << " -lzookeeper_st_gem"/$LIBS = "-lzookeeper_st_gem " + $LIBS/' ext/extconf.rb
	${RUBY} -C ext extconf.rb || die "extconf.rb failed"
}

each_ruby_compile() {
	emake -C ext
}

each_ruby_install() {
	each_fakegem_install
	insinto $(ruby_fakegem_gemsdir)/gems/zookeeper-${PV}/ext
	doins ext/*.so ext/*.rb
}
