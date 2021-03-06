# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/URI-Fetch/URI-Fetch-0.90.0-r1.ebuild,v 1.1 2014/08/26 18:55:53 axs Exp $

EAPI=5

MODULE_AUTHOR=BTROTT
MODULE_VERSION=0.09
inherit perl-module

DESCRIPTION="Smart URI fetching/caching"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-perl/Class-ErrorHandler
	virtual/perl-IO-Compress
	dev-perl/libwww-perl
	virtual/perl-Storable
	dev-perl/URI
"
DEPEND="${RDEPEND}"

SRC_TEST=online
