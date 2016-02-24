# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Virtual for operating system headers"
SLOT="0"
KEYWORDS="amd64 x86"

# depend on SLOT 0 of linux-headers, because kernel-2.eclass
# sets a different SLOT for cross-building
RDEPEND="
	|| (
		kernel_linux? ( sys-kernel/linux-headers:0 )
		!prefix? ( sys-freebsd/freebsd-lib )
	)"
