# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="Virtual to provide PHP-enabled webservers"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="5.3"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="|| ( =dev-lang/php-5.3*[apache2]
			  =dev-lang/php-5.3*[cgi]
			  =dev-lang/php-5.3*[fpm] )"
DEPEND=""
