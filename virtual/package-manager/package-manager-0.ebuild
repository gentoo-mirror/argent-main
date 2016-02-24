# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Virtual for the package manager"
SLOT="0"
KEYWORDS="amd64 x86"

RDEPEND="|| ( sys-apps/portage
		sys-apps/paludis
		sys-apps/pkgcore )"
