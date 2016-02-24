# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Virtual for SSH client and server"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="minimal"

RDEPEND="minimal? (
		|| ( net-misc/dropbear net-misc/openssh )
	)
	!minimal? (
		|| ( net-misc/openssh net-misc/dropbear )
	)"
