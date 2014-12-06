# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

RESTRICT="strip"

inherit versionator

MY_PV="$(replace_all_version_separators _ ${PV})"

DESCRIPTION="Adaptec Storage Manager (ASM)"
HOMEPAGE="http://www.adaptec.com/en-US/downloads/"
SRC_URI="amd64? ( http://download.adaptec.com/raid/storage_manager/${PN}_linux_x64_v${MY_PV}.tgz )
	x86? ( http://download.adaptec.com/raid/storage_manager/${PN}_linux_x86_v${MY_PV}.tgz )"

LICENSE="Adaptec"
SLOT="0"
KEYWORDS="-* amd64"
IUSE=""

RDEPEND="virtual/libstdc++:3.3"

S="${WORKDIR}"

src_install() {
	into /usr
	dosbin cmdline/arcconf
}
