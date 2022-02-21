# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="A library to identify devices by parsing user agent strings"
HOMEPAGE="
	https://github.com/selwin/python-user-agents
	https://pypi.org/project/user-agents/
"
MY_PN="python-${PN}"
SRC_URI="https://github.com/selwin/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=dev-python/ua-parser-0.10.0[${PYTHON_USEDEP}]"

distutils_enable_tests unittest

python_install_all() {
	distutils-r1_python_install_all
	find "${D}" -name '*tests.*' -delete || die "test removing failed"
}
