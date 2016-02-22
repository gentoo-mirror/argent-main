# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit unpacker eutils

DESCRIPTION="Tool for building and distributing virtual machines"
HOMEPAGE="http://vagrantup.com/"
SRC_URI="https://dl.bintray.com/mitchellh/vagrant/vagrant_${PV}_x86_64.deb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-arch/libarchive
	net-misc/curl
"

S="${WORKDIR}/opt/vagrant"

src_unpack() {
	unpack_deb ${A}
}

src_prepare() {
	sed -i 's/cached: true/cached: false/g' ./embedded/gems/gems/vagrant-1.7.2/plugins/provisioners/chef/provisioner/chef_solo.rb
}

src_install() {
	local dir="/opt/vagrant"
	dodir ${dir}
	cp -ar ./* "${ED}${dir}" || die "copy files failed"
	make_wrapper "vagrant" "${dir}/bin/vagrant"
}
