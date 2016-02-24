# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="WAL JSON output plugin"
HOMEPAGE="https://github.com/remerge/wal2json"

EGIT_REPO_URI="https://github.com/eulerto/wal2json.git"
EGIT_COMMIT="032f5d4a932e12066bdca9e92008540cbb66999d"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-db/postgresql"
RDEPEND="${DEPEND}"

src_compile() {
	emake USE_PGXS=1
}

src_install() {
	emake DESTDIR="${D}" USE_PGXS=1 install
}
