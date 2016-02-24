# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Virtual for the device filesystem manager"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="|| (
		virtual/udev
		sys-apps/busybox[mdev]
		sys-fs/devfsd
		sys-fs/static-dev
		sys-freebsd/freebsd-sbin
	)"
