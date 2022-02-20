# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} pypy3 )
inherit distutils-r1

DESCRIPTION="Apache2 licensed Python sorted collections library"
HOMEPAGE="
	http://www.grantjenks.com/docs/sortedcollections/
	https://pypi.org/project/sortedcollections/
"
MY_PN="python-${PN}"
SRC_URI="https://github.com/grantjenks/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

RDEPEND="dev-python/sortedcontainers[${PYTHON_USEDEP}]"
BDEPEND="doc? ( ${RDEPEND} )"

distutils_enable_tests pytest
distutils_enable_sphinx docs

src_prepare() {
	# breaks pytest
	rm tox.ini || die

	distutils-r1_src_prepare
}

python_test() {
	epytest --doctest-glob="*.rst"
}
