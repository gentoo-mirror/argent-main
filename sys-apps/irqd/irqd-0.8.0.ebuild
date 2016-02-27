# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools git-2

DESCRIPTION="IRQ balancing daemon"
HOMEPAGE="https://github.com/vaesoo/irqd"
EGIT_REPO_URI="https://github.com/vaesoo/irqd.git"
EGIT_COMMIT="598bbf5685e9d15fd3ea7ab40b8026df858d70b8"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-libs/libnl"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
