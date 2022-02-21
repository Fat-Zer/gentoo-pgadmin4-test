# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="A typlog Sphinx theme"
HOMEPAGE="
	https://github.com/typlog/sphinx-typlog-theme
	https://pypi.org/project/sphinx-typlog-theme/
"
SRC_URI="https://github.com/typlog/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

distutils_enable_sphinx docs
