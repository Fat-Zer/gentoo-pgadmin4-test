# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="The bidirectional mapping library for Python"
HOMEPAGE="
	https://bidict.readthedocs.io
	https://pypi.org/project/bidict/
"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="test? (
	dev-python/hypothesis[${PYTHON_USEDEP}]
	dev-python/sortedcontainers[${PYTHON_USEDEP}]
	dev-python/sortedcollections[${PYTHON_USEDEP}]
)"

DOCS=( CHANGELOG.rst CONTRIBUTING.rst README.rst )

distutils_enable_tests pytest
distutils_enable_sphinx docs dev-python/alabaster

# disble benchmarking: no use in it ouside of a CI
EPYTEST_IGNORE=(
	tests/test_benchmark.py
)

python_prepare_all() {
	# Comment out benchmark args to pytest
	sed -e '/--benchmark/s/^/#/' \
		-i pytest.ini || die
	distutils-r1_python_prepare_all
}
