# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..9} )
inherit distutils-r1

DESCRIPTION="Socket.IO server and client for Python"
HOMEPAGE="
	https://github.com/miguelgrinberg/python-socketio
	https://pypi.org/project/python-socketio/
"
SRC_URI="https://github.com/miguelgrinberg/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND="
	>=dev-python/bidict-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-4.3.0[${PYTHON_USEDEP}]
"
BDEPEND="test? (
	dev-python/msgpack[${PYTHON_USEDEP}]
)"

distutils_enable_tests pytest
distutils_enable_sphinx docs

# setup.cfg defines a couple of extra_require, but it doesn't actually
# references them in code besides the docs and the examples.
#  asyncio-client: dev-python/aiohttp
#  client: dev-python/requests 
#          dev-python/websocket-client

python_install_all() {
	distutils-r1_python_install_all

	if use examples; then
		dodoc -r examples
		docompress -x "/usr/share/doc/${PF}/examples"
	fi
}
