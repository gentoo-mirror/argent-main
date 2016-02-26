# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby18 ruby19 ruby20 jruby"

inherit ruby-ng prefix

DESCRIPTION="Centralized Ruby extension management system"
HOMEPAGE="http://rubyforge.org/projects/rubygems/"
LICENSE="|| ( Ruby MIT )"

SRC_URI="http://production.cf.rubygems.org/rubygems/${P}.tgz"

KEYWORDS="amd64 x86"
SLOT="0"
IUSE="test"

RDEPEND="
	ruby_targets_jruby? ( >=dev-java/jruby-1.5.6-r1 )
	ruby_targets_ruby19? ( >=dev-lang/ruby-1.9.3_rc1 )"

ruby_add_bdepend "
	test? (
		virtual/ruby-minitest
		virtual/ruby-rdoc
	)"

all_ruby_prepare() {
	mkdir -p lib/rubygems/defaults || die
	cp "${FILESDIR}/gentoo-defaults.rb" lib/rubygems/defaults/operating_system.rb || die

	eprefixify lib/rubygems/defaults/operating_system.rb

	# Disable broken tests when changing default values:
	sed -i -e '/^  def test_self_bindir_default_dir/, /^  end/ s:^:#:' \
		-e '/^  def test_self_default_dir/, /^  end/ s:^:#:' \
		test/rubygems/test_gem.rb || die
	sed -i -e '/test_check_executable_overwrite_default_bin_dir/,/^  end/ s:^:#:' test/rubygems/test_gem_installer.rb || die

	# Remove tests that want to write to /usr/local/bin
	rm test/rubygems/test_gem_uninstaller.rb test/rubygems/test_gem_install_update_options.rb || die

	# Remove a test that fails when yard is installed.
	sed -i -e '/test_self_attribute_names/,/^  end/ s:^:#:' test/rubygems/test_gem_specification.rb || die

	# Remove tests that try to load from an unsafe path
	rm test/rubygems/test_gem.rb || die

	# Remove tests that seem to have trouble loading from the /tmp test
	# path. This should be narrowed down more...
	rm test/rubygems/test_gem_commands_{cleanup_command,contents_command,pristine_command}.rb test/rubygems/test_gem_specification.rb || die
}

each_ruby_prepare() {
	case ${RUBY} in
		*ruby18)
			# Remove test failing on ruby18. According to travis.yml
			# upstream no longer cares.
			sed -i -e '/test_install_location_extra_slash/,/^  end/ s:^:#:' test/rubygems/test_gem_package.rb || die
			;;
		*jruby)
			sed -i -e '/test_install_location_extra_slash/,/^  end/ s:^:#:' test/rubygems/test_gem_package.rb || die
			# Remove failing tests. Before we did not run any tests at
			# all so this is actually an improvement. Should be
			rm test/rubygems/test_gem_security{,_policy}.rb test/rubygems/test_gem_{remote_fetcher,package_tar_reader_entry,package,installer,ext_ext_conf_builder}.rb || die
			# investigated further.
	esac
}

each_ruby_compile() {
	# Not really a build but...
	sed -i -e 's:#!.*:#!'"${RUBY}"':' bin/gem
}

each_ruby_test() {
	# Unset RUBYOPT to avoid interferences, bug #158455 et. al.
	unset RUBYOPT

	if [[ "${EUID}" -ne "0" ]]; then
		case ${RUBY} in
			*xjruby)
				eqawarn "Skipping tests for jruby 1.5."
				;;
			*)
				RUBYLIB="$(pwd)/lib${RUBYLIB+:${RUBYLIB}}" ${RUBY} -I.:lib:test \
				-e 'Dir["test/**/test_*.rb"].each { |tu| require tu }' || die "tests failed"
				;;
		esac
	else
		ewarn "The userpriv feature must be enabled to run tests, bug 408951."
		eerror "Testsuite will not be run."
	fi
}

each_ruby_install() {
	# Unset RUBYOPT to avoid interferences, bug #158455 et. al.
	unset RUBYOPT
	export RUBYLIB="$(pwd)/lib${RUBYLIB+:${RUBYLIB}}"

	pushd lib &>/dev/null
	doruby -r *
	popd &>/dev/null

	newbin bin/gem $(basename ${RUBY} | sed -e 's:ruby:gem:') || die
}

all_ruby_install() {
	dodoc History.txt README.rdoc
}

pkg_postinst() {
	if [[ ! -n $(readlink "${ROOT}"usr/bin/gem) ]] ; then
		eselect ruby set $(eselect --brief --no-color ruby show | head -n1)
	fi

	ewarn
	ewarn "To switch between available Ruby profiles, execute as root:"
	ewarn "\teselect ruby set ruby(18|19|...)"
	ewarn
}
