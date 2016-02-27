# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Virtual for awk implementation"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="
	|| (
		>=sys-apps/gawk-4.0.1-r1
		sys-apps/mawk
		sys-apps/nawk
		sys-apps/busybox
	)
	!<sys-apps/gawk-4.0.1-r1" #before 4.0.1-r1 awk symlinks did belong to gawk #455696
