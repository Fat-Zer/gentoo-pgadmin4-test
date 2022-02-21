# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="The ultimate Python library in building OAuth and OpenID Connect servers"
HOMEPAGE="
	https://authlib.org/
	https://pypi.org/project/Authlib/
"
SRC_URI="https://github.com/lepture/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"
BDEPEND="test? (
	<dev-python/django-4.0.0[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/flask-sqlalchemy[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/itsdangerous[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	dev-python/pytest-django[${PYTHON_USEDEP}]
	dev-python/starlette[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
)"
# django<4 is required due to https://github.com/lepture/authlib/issues/423

# see https://github.com/lepture/authlib/issues/284
PATCHES=( "${FILESDIR}/${P}-Allow-tests-to-be-run-together-in-a-pytest-session.patch" )

distutils_enable_tests pytest
distutils_enable_sphinx docs dev-python/sphinx-typlog-theme
