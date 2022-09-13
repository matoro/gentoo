# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.7.9999
#hackport: flags: +pkg-config

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Compression and decompression in the gzip and zlib formats"
HOMEPAGE="https://hackage.haskell.org/package/zlib"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~riscv ~x86 ~ppc-macos"
IUSE="bundled-c-zlib non-blocking-ffi"

RDEPEND=">=dev-lang/ghc-8.4.3:=
	sys-libs/zlib
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2.0.1
	virtual/pkgconfig
	test? ( >=dev-haskell/quickcheck-2 <dev-haskell/quickcheck-3
		>=dev-haskell/tasty-0.8 <dev-haskell/tasty-1.5
		>=dev-haskell/tasty-hunit-0.8 <dev-haskell/tasty-hunit-0.11
		>=dev-haskell/tasty-quickcheck-0.8 <dev-haskell/tasty-quickcheck-0.11 )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag bundled-c-zlib bundled-c-zlib) \
		$(cabal_flag non-blocking-ffi non-blocking-ffi) \
		--flag=pkg-config
}
