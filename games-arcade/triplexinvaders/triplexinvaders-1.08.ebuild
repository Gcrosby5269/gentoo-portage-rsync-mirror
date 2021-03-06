# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-arcade/triplexinvaders/triplexinvaders-1.08.ebuild,v 1.10 2015/01/05 19:42:38 tupone Exp $

EAPI=5
inherit eutils games

DESCRIPTION="An Alien Invaders style game with 3d graphics"
HOMEPAGE="http://triplexinvaders.infogami.com"
SRC_URI="http://acm.jhu.edu/~arthur/invaders/${P}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="dev-python/pygame
	dev-python/pyopengl"

src_prepare() {
	epatch "${FILESDIR}/${P}"-gentoo.patch
	sed -i -e "s:@GENTOO_DATADIR@:${GAMES_DATADIR}/${PN}:" \
		sound.py \
		util.py \
		hiscore.py \
		options.py || die "sed failed"
}

src_install() {
	local libdir=$(games_get_libdir)

	insinto "${libdir}/${PN}"
	doins -r *.py
	insinto "${GAMES_DATADIR}/${PN}"
	doins -r models sound options.conf hiscores
	games_make_wrapper ${PN} "python ./invaders.py" "${libdir}/${PN}"
	dodoc README.txt TODO.txt
	prepgamesdirs
}
