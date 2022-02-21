# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..9} )
inherit distutils-r1

DESCRIPTION="Socket.IO integration for Flask applications"
HOMEPAGE="
	https://github.com/miguelgrinberg/flask-socketio
	https://pypi.org/project/Flask-SocketIO/
"
SRC_URI="https://github.com/miguelgrinberg/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
MY_PN="Flask-SocketIO"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND="
	>=dev-python/flask-0.9[${PYTHON_USEDEP}]
	>=dev-python/python-socketio-5.0.2[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
distutils_enable_sphinx docs

# It's not actuall a test but a port of the package itself
EPYTEST_IGNORE=( src/flask_socketio/test_client.py )

python_install_all() {
	distutils-r1_python_install_all

	if use examples; then
		dodoc -r example
		docompress -x "/usr/share/doc/${PF}/example"
	fi
}
