# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-emulation/dosbox/dosbox-0.74.ebuild,v 1.16 2015/01/17 14:17:17 tupone Exp $

EAPI=5
inherit eutils games

DESCRIPTION="DOS emulator"
HOMEPAGE="http://dosbox.sourceforge.net/"
SRC_URI="mirror://sourceforge/dosbox/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm ppc ppc64 ~sparc x86"
IUSE="alsa debug hardened opengl"

DEPEND="alsa? ( media-libs/alsa-lib )
	opengl? ( virtual/glu virtual/opengl )
	debug? ( sys-libs/ncurses )
	media-libs/libpng:0
	media-libs/libsdl[joystick,video,X]
	media-libs/sdl-net
	media-libs/sdl-sound"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}"/${P}-gcc46.patch )

src_configure() {
	egamesconf \
		$(use_enable alsa alsa-midi) \
		$(use_enable !hardened dynamic-core) \
		$(use_enable !hardened dynamic-x86) \
		$(use_enable debug) \
		$(use_enable opengl)
}

src_install() {
	default
	make_desktop_entry dosbox DOSBox /usr/share/pixmaps/dosbox.ico
	doicon src/dosbox.ico
	prepgamesdirs
}
