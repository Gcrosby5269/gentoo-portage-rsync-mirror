# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/appstream-glib/appstream-glib-0.3.4.ebuild,v 1.1 2015/01/24 13:02:55 pacho Exp $

EAPI=5
GCONF_DEBUG="no"
GNOME2_LA_PUNT="yes"

inherit bash-completion-r1 gnome2

DESCRIPTION="Provides GObjects and helper methods to read and write AppStream metadata"
HOMEPAGE="http://people.freedesktop.org/~hughsient/appstream-glib/"
SRC_URI="http://people.freedesktop.org/~hughsient/${PN}/releases/${P}.tar.xz"

LICENSE="LGPL-2.1"
SLOT="0/7"
KEYWORDS="~amd64 ~arm ~hppa ~ppc ~ppc64 ~x86"
IUSE="+introspection nls"

# FIXME: yaml is optional with --enable-dep11 but not
# properly handled in autofoo bug#????
RDEPEND="
	app-arch/libarchive
	dev-db/sqlite:3
	>=dev-libs/glib-2.16.1:2
	>=media-libs/fontconfig-2.11
	>=media-libs/freetype-2.4:2
	>=net-libs/libsoup-2.24:2.4
	>=x11-libs/gdk-pixbuf-2.14:2
	x11-libs/gtk+:3
	x11-libs/pango
	dev-libs/libyaml
	introspection? ( >=dev-libs/gobject-introspection-0.9.8 )
"
DEPEND="${RDEPEND}
	app-text/docbook-xml-dtd:4.3
	dev-libs/libxslt
	>=dev-util/gtk-doc-am-1.9
	>=dev-util/intltool-0.40
	>=sys-devel/gettext-0.17
"
# ${PN} superseeds appdata-tools, require dummy package until all ebuilds
# are migrated to appstream-glib
RDEPEND="${RDEPEND}
	!<dev-util/appdata-tools-0.1.8-r1"
PDEPEND=">=dev-util/appdata-tools-0.1.8-r1"

src_configure() {
	gnome2_src_configure \
		--disable-rpm \
		--disable-static \
		--enable-dep11 \
		--enable-man \
		$(use_enable nls) \
		$(use_enable introspection) \
		--with-bashcompletiondir="$(get_bashcompdir)"
}
