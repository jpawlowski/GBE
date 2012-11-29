#!/bin/bash
#
# Gemeinschaft 5
# Enable system services
#
# Copyright (c) 2012, Julian Pawlowski <jp@jps-networks.eu>
# See LICENSE.GBE file for details.
#

# check each command return codes for errors
#
set -e

# General settings
source /gdfdl.conf
[ -f /gdfdl-custom.conf ] && source /gdfdl-custom.conf

echo -e "\n###########################################################
## GBE: System bootup configuration\n\n"

echo -e "GBE: Enabling system services ...\n"
update-rc.d gs-ssl defaults 2>&1