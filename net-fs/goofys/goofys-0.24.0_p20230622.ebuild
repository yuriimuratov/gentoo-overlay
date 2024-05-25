# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Goofys allows you to mount an S3 bucket as a filey system."
HOMEPAGE="https://github.com/kahing/goofys"
GIT_COMMIT="350ff312abaa1abcf21c5a06e143c7edffe9e2f4"
SRC_URI="https://github.com/kahing/${PN}/archive/${GIT_COMMIT}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" http://nbg1-htz.citynet.lg.ua/files/${P}-vendor.tar.xz"
S="${WORKDIR}/${PN}-${GIT_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64"
RESTRICT="test run-test" # fails

DOCS=( "README.md" )

src_unpack() {
	unpack ${A}
	eapply -p0 "${FILESDIR}"/${P}-gomod.patch
}

src_compile() {
	export CGO_ENABLED=0
	go build -ldflags "-X main.Version=p20230622-gentoo"
}

src_install() {
	einstalldocs
	insopts -m0644 -p # preserve timestamps for bug 551486
	dobin goofys
}
