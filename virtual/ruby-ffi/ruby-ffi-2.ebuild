# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
USE_RUBY="ruby19 ruby20 jruby"

inherit ruby-ng

DESCRIPTION="Virtual ebuild for the Ruby ffi library"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="ruby_targets_ruby19? ( dev-ruby/ffi[ruby_targets_ruby19] )
	ruby_targets_ruby20? ( dev-ruby/ffi[ruby_targets_ruby20] )
	ruby_targets_jruby? ( dev-java/jruby )"
DEPEND=""

pkg_setup() { :; }
src_unpack() { :; }
src_prepare() { :; }
src_compile() { :; }
src_install() { :; }
pkg_preinst() { :; }
pkg_postinst() { :; }
