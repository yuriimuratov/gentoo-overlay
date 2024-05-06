# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Environment variable manager for shell"
HOMEPAGE="https://github.com/direnv/direnv"
SRC_URI="https://github.com/direnv/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" http://nbg1-htz.citynet.lg.ua/files/${P}-vendor.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64"
RESTRICT="test" # fails

DOCS=( {CHANGELOG,README}.md )

src_install() {
	einstalldocs
	emake DESTDIR="${D}" PREFIX="/usr" install
}
