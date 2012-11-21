#!/bin/bash
#
# Gemeinschaft 5
# Standard Linux Settings for Gemeinschaft 5
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
## GBE: Gemeinschaft specific system configuration\n\n"

echo -e "GBE: Create service group ${GS_GROUP} ...\n"
groupadd -r -f ${GS_GROUP}

echo -e "GBE: Create service account ${GS_USER} ...\n"
useradd ${GS_USER} -N -m -r -s /bin/bash -c "Gemeinschaft Service Account" -g ${GS_GROUP}

echo -e "GBE: Create admin account ${GS_USER} ...\n"
useradd ${GS_USER_ADMIN} -N -m -s /bin/bash -c "Gemeinschaft Administrator Account" -g ${GS_GROUP}
adduser ${GS_USER_ADMIN} sudo
echo "${GS_USER_ADMIN}:${GS_PASSWORD_ADMIN}" | chpasswd

echo -e "GBE: Correcting file permissions ...\n"
chmod 0440 /etc/sudoers.d/*

echo - "GBE: Enable bootlog ...\n"
sed -i 's/BOOTLOGD_ENABLE=No/BOOTLOGD_ENABLE=yes/' /etc/default/bootlogd
