# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.7.2.1.9999
#hackport: flags: -pedantic
CABAL_PN="X11-xft"

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Bindings to the Xft and some Xrender parts"
HOMEPAGE="https://hackage.haskell.org/package/X11-xft"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86"

RDEPEND=">=dev-haskell/utf8-string-0.1:=[profile?]
	>=dev-haskell/x11-1.2.1:=[xinerama,profile?]
	>=dev-lang/ghc-8.4.3:=
	x11-libs/libXft
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
"
BDEPEND="virtual/pkgconfig
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=-pedantic
}
