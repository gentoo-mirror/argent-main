# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Virtual for various init implementations"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="!prefix? (
	kernel_linux? ( || ( >=sys-apps/sysvinit-2.86-r6 sys-process/runit ) )
	kernel_FreeBSD? ( sys-freebsd/freebsd-sbin )
	)"
DEPEND=""
