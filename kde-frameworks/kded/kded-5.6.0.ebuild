# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-frameworks/kded/kded-5.6.0.ebuild,v 1.1 2015/01/09 18:25:29 mrueg Exp $

EAPI=5

KDE_TEST="false"
inherit kde5

DESCRIPTION="Central daemon of KDE workspaces"
LICENSE="LGPL-2+"
KEYWORDS=" ~amd64 ~x86"
IUSE=""

RDEPEND="
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kinit)
	$(add_frameworks_dep kservice)
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
"
DEPEND="${RDEPEND}
	$(add_frameworks_dep kdoctools)
"
