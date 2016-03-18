# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit flag-o-matic

DESCRIPTION="Tools to make diffs and compare files"
HOMEPAGE="https://www.gnu.org/software/diffutils/"
SRC_URI="mirror://gnu-alpha/diffutils/${P}.tar.xz
	mirror://gnu/diffutils/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="nls static"

DEPEND="app-arch/xz-utils
	nls? ( sys-devel/gettext )"

DOCS=( AUTHORS ChangeLog NEWS README THANKS TODO )

src_prepare() {
	# Disable gnulib build test that has no impact on the source.
	# Re-enable w/next version bump (and gnulib is updated). #554728
	[[ ${PV} != "3.3" ]] && die "re-enable test #554728"
	echo 'exit 0' > gnulib-tests/test-update-copyright.sh || die

	sed -i 's:@mkdir_p@:@MKDIR_P@:g' po/Makefile.in.in || die #464604
}

src_configure() {
	use static && append-ldflags -static

	# Disable automagic dependency over libsigsegv; see bug #312351.
	export ac_cv_libsigsegv=no

	econf \
		--with-packager="Gentoo" \
		--with-packager-version="${PVR}" \
		--with-packager-bug-reports="https://bugs.gentoo.org/" \
		$(use_enable nls)
}

src_test() {
	# explicitly allow parallel testing
	emake check
}
