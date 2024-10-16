# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="OpenPGP keys used by Thomas Dickey"
HOMEPAGE="https://invisible-island.net/public/public.html"
SRC_URI="https://invisible-island.net/public/dickey@invisible-island.net-rsa3072.asc -> ${P}-dickey@invisible-island.net-rsa3072.asc"
S="${WORKDIR}"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86"

src_install() {
	local files=( ${A} )
	insinto /usr/share/openpgp-keys
	newins - thomasdickey.asc < <(cat "${files[@]/#/${DISTDIR}/}" || die)
}
