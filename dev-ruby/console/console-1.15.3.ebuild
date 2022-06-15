# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby26 ruby27 ruby30 ruby31"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"
inherit ruby-fakegem

DESCRIPTION="Beautiful logging for Ruby"
HOMEPAGE="https://github.com/socketry/console"
SRC_URI="https://github.com/socketry/console/archive/fc6ecb94bc02b8b75003fc31f0a8b3e1e43cafcf.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="$(ver_cut 1)/$(ver_cut 1-2)"
KEYWORDS="~amd64 ~sparc"
IUSE=""
RUBY_S="${PN}-fc6ecb94bc02b8b75003fc31f0a8b3e1e43cafcf"

ruby_add_rdepend "dev-ruby/fiber-local"

all_ruby_prepare() {
	sed -i -E 's/require_relative "(.+)"/require File.expand_path("\1")/g' "${RUBY_FAKEGEM_GEMSPEC}" || die
	rm -f "gems.rb" || die
	sed -i -E 's/require '"'"'covered\/rspec'"'"'//g' "spec/spec_helper.rb" || die
}
