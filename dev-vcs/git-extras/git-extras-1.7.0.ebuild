# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit bash-completion-r1

DESCRIPTION="GIT utilities -- repo summary, repl, changelog population, author commit percentages and more"
HOMEPAGE="https://github.com/visionmedia/git-extras"
SRC_URI="https://github.com/visionmedia/git-extras/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-vcs/git"

src_compile() {
	: # do nothing
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
	newbashcomp "${D}"/etc/bash_completion.d/git-extras ${PN}
	rm -rf "${D}"/etc/bash_completion.d || die
}
