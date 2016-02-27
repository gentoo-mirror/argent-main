# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit multilib-build

DESCRIPTION="Virtual to select between sys-fs/udev and sys-fs/eudev"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
# These default enabled IUSE flags should follow defaults of sys-fs/udev.
IUSE="gudev introspection +kmod selinux static-libs"

DEPEND=""
RDEPEND=">=sys-apps/systemd-208[${MULTILIB_USEDEP},gudev?,introspection?,kmod?,selinux?]"
