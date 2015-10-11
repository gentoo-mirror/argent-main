# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-servers/apache/apache-2.4.9-r2.ebuild,v 1.1 2014/04/21 09:45:27 polynomial-c Exp $

EAPI=5

# latest gentoo apache files
GENTOO_PATCHSTAMP="20140421"
GENTOO_DEVELOPER="polynomial-c"
GENTOO_PATCHNAME="gentoo-apache-2.4.9-r2"

# IUSE/USE_EXPAND magic
IUSE_MPMS_FORK="itk peruser prefork"
IUSE_MPMS_THREAD="event worker"

# << obsolete modules:
# authn_default authz_default mem_cache
# mem_cache is replaced by cache_disk
# ?? buggy modules
# proxy_scgi: startup error: undefined symbol "ap_proxy_release_connection", no fix found
# >> added modules for reason:
# compat: compatibility with 2.2 access control
# authz_host: new module for access control
# authn_core: functionality provided by authn_alias in previous versions
# authz_core: new module, provides core authorization capabilities
# cache_disk: replacement for mem_cache
# lbmethod_byrequests: Split off from mod_proxy_balancer in 2.3
# lbmethod_bytraffic: Split off from mod_proxy_balancer in 2.3
# lbmethod_bybusyness: Split off from mod_proxy_balancer in 2.3
# lbmethod_heartbeat: Split off from mod_proxy_balancer in 2.3
# slotmem_shm: Slot-based shared memory provider (for lbmethod_byrequests).
# socache_shmcb: shared object cache provider. Default config with ssl needs it
# unixd: fixes startup error: Invalid command 'User'
IUSE_MODULES="access_compat actions alias asis auth_basic auth_digest authn_alias authn_anon
authn_core authn_dbd authn_dbm authn_file authz_core authz_dbm
authz_groupfile authz_host authz_owner authz_user autoindex cache cache_disk cern_meta
charset_lite cgi cgid dav dav_fs dav_lock dbd deflate dir dumpio
env expires ext_filter file_cache filter headers ident imagemap include info
lbmethod_byrequests lbmethod_bytraffic lbmethod_bybusyness lbmethod_heartbeat
log_config log_forensic logio mime mime_magic negotiation proxy
proxy_ajp proxy_balancer proxy_connect proxy_ftp proxy_http proxy_scgi proxy_fcgi
rewrite ratelimit remoteip reqtimeout setenvif slotmem_shm speling socache_shmcb status substitute
unique_id userdir usertrack unixd version vhost_alias"
# The following are also in the source as of this version, but are not available
# for user selection:
# bucketeer case_filter case_filter_in echo http isapi optional_fn_export
# optional_fn_import optional_hook_export optional_hook_import

# inter-module dependencies
# TODO: this may still be incomplete
MODULE_DEPENDS="
	dav_fs:dav
	dav_lock:dav
	deflate:filter
	cache_disk:cache
	ext_filter:filter
	file_cache:cache
	lbmethod_byrequests:proxy_balancer
	lbmethod_byrequests:slotmem_shm
	lbmethod_bytraffic:proxy_balancer
	lbmethod_bybusyness:proxy_balancer
	lbmethod_heartbeat:proxy_balancer
	log_forensic:log_config
	logio:log_config
	cache_disk:cache
	mime_magic:mime
	proxy_ajp:proxy
	proxy_balancer:proxy
	proxy_balancer:slotmem_shm
	proxy_connect:proxy
	proxy_ftp:proxy
	proxy_http:proxy
	proxy_scgi:proxy
	proxy_fcgi:proxy
	substitute:filter
"

# module<->define mappings
MODULE_DEFINES="
	auth_digest:AUTH_DIGEST
	authnz_ldap:AUTHNZ_LDAP
	cache:CACHE
	cache_disk:CACHE
	dav:DAV
	dav_fs:DAV
	dav_lock:DAV
	file_cache:CACHE
	info:INFO
	ldap:LDAP
	proxy:PROXY
	proxy_ajp:PROXY
	proxy_balancer:PROXY
	proxy_connect:PROXY
	proxy_ftp:PROXY
	proxy_http:PROXY
	proxy_fcgi:PROXY
	proxy_scgi:PROXY
	socache_shmcb:SSL
	ssl:SSL
	status:STATUS
	suexec:SUEXEC
	userdir:USERDIR
"

# critical modules for the default config
MODULE_CRITICAL="
	authn_core
	authz_core
	authz_host
	dir
	mime
	unixd
"
inherit eutils apache-2 systemd toolchain-funcs

DESCRIPTION="The Apache Web Server."
HOMEPAGE="http://httpd.apache.org/"

# some helper scripts are Apache-1.1, thus both are here
LICENSE="Apache-2.0 Apache-1.1"
SLOT="2"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~sparc-fbsd ~x86-fbsd"
IUSE=""

DEPEND="${DEPEND}
	>=dev-libs/openssl-0.9.8m
	apache2_modules_deflate? ( sys-libs/zlib )"

# dependency on >=dev-libs/apr-1.5.0 for bug #492578
RDEPEND="${RDEPEND}
	>=dev-libs/apr-1.5.0
	>=dev-libs/openssl-0.9.8m
	apache2_modules_mime? ( app-misc/mime-types )"

pkg_setup() {
	# dependend critical modules which are not allowed in global scope due
	# to USE flag conditionals (bug #499260)
	use ssl && MODULE_CRITICAL+=" socache_shmcb"
	use doc && MODULE_CRITICAL+=" alias negotiation setenvif"
	apache-2_pkg_setup
}

src_prepare() {
	use alpn && epatch "${FILESDIR}"/${PN}-2.4.12-alpn.patch #471512
	apache-2_src_prepare
}

src_configure() {
	# Brain dead check.
	tc-is-cross-compiler && export ap_cv_void_ptr_lt_long="no"

	apache-2_src_configure
}

src_compile() {
	if tc-is-cross-compiler; then
		# This header is the same across targets, so use the build compiler.
		pushd server >/dev/null
		emake gen_test_char
		tc-export_build_env BUILD_CC
		${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_CPPFLAGS} ${BUILD_LDFLAGS} \
			gen_test_char.c -o gen_test_char $(apr-1-config --includes) || die
		popd >/dev/null
	fi

	default
}

src_install() {
	apache-2_src_install
	for i in /usr/bin/{htdigest,logresolve,htpasswd,htdbm,ab,httxt2dbm}; do
		rm "${D}"/$i || die "Failed to prune apache-tools bits"
	done
	for i in /usr/share/man/man8/{rotatelogs.8,htcacheclean.8}; do
		rm "${D}"/$i || die "Failed to prune apache-tools bits"
	done
	for i in /usr/share/man/man1/{logresolve.1,htdbm.1,htdigest.1,htpasswd.1,dbmmanage.1,ab.1}; do
		rm "${D}"/$i || die "Failed to prune apache-tools bits"
	done
	for i in /usr/sbin/{checkgid,fcgistarter,htcacheclean,rotatelogs}; do
		rm "${D}/"$i || die "Failed to prune apache-tools bits"
	done

	# well, actually installing things makes them more installed, I guess?
	cp "${S}"/support/apxs "${D}"/usr/sbin/apxs || die "Failed to install apxs"
	chmod 0755 "${D}"/usr/sbin/apxs

	# Note: wait for mod_systemd to be included in the next release,
	# then apache2.4.service can be used and systemd support controlled
	# through --enable-systemd
	systemd_newunit "${FILESDIR}/apache2.2.service" "apache2.service"
	systemd_dotmpfilesd "${FILESDIR}/apache.conf"
	#insinto /etc/apache2/modules.d
	#doins "${FILESDIR}/00_systemd.conf"

	# systemd support for logrotate scripts
	# override Gentoo logrotate script with a version
	# that works for both openrc and systemd
	insinto /etc/logrotate.d
	newins "${FILESDIR}"/apache2-logrotate apache2
}

pkg_postinst()
{
	apache-2_pkg_postinst || die "apache-2_pkg_postinst failed"
	# warnings that default config might not work out of the box
	for mod in $MODULE_CRITICAL; do
		if ! use "apache2_modules_${mod}"; then
			echo
			ewarn "Warning: Critical module not installed!"
			ewarn "Modules 'authn_core', 'authz_core' and 'unixd'"
			ewarn "are highly recomended but might not be in the base profile yet."
			ewarn "Default config for ssl needs module 'socache_shmcb'."
			ewarn "Enabling the following flags is highly recommended:"
			for cmod in $MODULE_CRITICAL; do
				use "apache2_modules_${cmod}" || \
					ewarn "+ apache2_modules_${cmod}"
			done
			echo
			break
		fi
	done
	# warning for proxy_balancer and missing load balancing scheduler
	if use apache2_modules_proxy_balancer; then
		local lbset=
		for mod in lbmethod_byrequests lbmethod_bytraffic lbmethod_bybusyness lbmethod_heartbeat; do
			if use "apache2_modules_${mod}"; then
				lbset=1 && break
			fi
		done
		if [ ! $lbset ]; then
			echo
			ewarn "Info: Missing load balancing scheduler algorithm module"
			ewarn "(They were split off from proxy_balancer in 2.3)"
			ewarn "In order to get the ability of load balancing, at least"
			ewarn "one of these modules has to be present:"
			ewarn "lbmethod_byrequests lbmethod_bytraffic lbmethod_bybusyness lbmethod_heartbeat"
			echo
		fi
	fi
}
