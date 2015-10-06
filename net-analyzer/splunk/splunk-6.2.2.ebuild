# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_BUILD="255606"

DESCRIPTION="The search engine for IT data"
HOMEPAGE="http://www.splunk.com"
REL_URI="http://download.splunk.com/products/splunk/releases/${PV}/splunk/linux"
SRC_URI="amd64? ( ${REL_URI}/${P}-${MY_BUILD}-Linux-x86_64.tgz )"

LICENSE="splunk-eula"
SLOT="6"
KEYWORDS="-* amd64"
IUSE=""

DEPEND="!!net-analyzer/splunk:0"
RDEPEND="!net-analyzer/splunkforwarder"

S="${WORKDIR}"/${PN}

src_install() {
	dodir /opt
	mv "${S}" "${D}"/opt/splunk

	# various symlinks for FHS compat
	dosym /opt/splunk/etc /etc/splunk
	dosym /opt/splunk/var/log/splunk /var/log/splunk
	dosym /opt/splunk/var/run/splunk /var/run/splunk
	dosym /opt/splunk/var/spool/splunk /var/spool/splunk

	# symlink a bunch of commands to /usr/bin
	dosym /opt/splunk/bin/splunk /usr/bin/splunk

	newinitd "${FILESDIR}"/splunk.initd splunk

	echo "LDPATH=/opt/splunk/lib" > "${T}/99splunk"
	doenvd "${T}/99splunk"
}
