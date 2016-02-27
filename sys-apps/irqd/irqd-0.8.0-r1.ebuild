# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools git-2

DESCRIPTION="IRQ balancing daemon"
HOMEPAGE="https://github.com/vaesoo/irqd"
EGIT_REPO_URI="https://github.com/vaesoo/irqd.git"
EGIT_COMMIT="a21b45758212f27fb46c60ff526d26135e5eeed0"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-libs/libnl"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
