# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit java-pkg-2 rpm

DESCRIPTION="Extensible continuous integration server"
HOMEPAGE="http://jenkins-ci.org/"
SRC_URI="http://pkg.jenkins-ci.org/redhat/RPMS/noarch/jenkins-${PV}-1.1.noarch.rpm"

LICENSE="MIT"
RESTRICT="mirror"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="media-fonts/dejavu"
RDEPEND="${DEPEND}
	>=virtual/jdk-1.5"

S="${WORKDIR}"

src_unpack() {
	rpm_src_unpack ${A}
}

pkg_setup() {
	enewgroup jenkins
	enewuser jenkins -1 /bin/bash /var/lib/jenkins jenkins
}

src_install() {
	insinto /usr/lib/jenkins
	doins usr/lib/jenkins/jenkins.war

	newinitd "${FILESDIR}/jenkins.initd" jenkins
	newconfd "${FILESDIR}/jenkins.confd" jenkins
}
