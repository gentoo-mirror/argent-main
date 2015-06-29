# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Virtual for editor"
SLOT="0"
KEYWORDS="amd64"

# Add a package to RDEPEND only if the editor:
# - can edit ordinary text files,
# - works on the console.

DEPEND=""
RDEPEND="|| (
	app-editors/vim
	app-misc/mc[edit]
	sys-apps/ed
)"

# Packages outside app-editors providing an editor:
#	app-misc/mc: mcedit (#62643)
#	dev-lisp/cmucl: hemlock
#	mail-client/alpine: pico
#	sys-apps/busybox: vi
