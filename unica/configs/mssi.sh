# Copyright (c) 2025 Salvo Giangreco
# SPDX-License-Identifier: GPL-3.0-or-later

# UN1CA configuration file for MediaTek devices (mssi)

# Inherit source firmware configuration from qssi (Galaxy S23 Ultra)
source "$SRC_DIR/unica/configs/qssi.sh" || return 1

# Galaxy A34 5G (Donor firmware for MTK-specific components)
SOURCE_EXTRA_FIRMWARES=("SM-A346B/EUX/351648441234565")
SOURCE_SUPER_GROUP_NAME="main"
