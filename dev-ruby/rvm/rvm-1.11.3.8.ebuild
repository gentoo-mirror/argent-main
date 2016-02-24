# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="RVM Ruby Gem Library"
HOMEPAGE="https://rvm.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
