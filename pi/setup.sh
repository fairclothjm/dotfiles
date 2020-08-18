#!/usr/bin/env bash

#
#; script to setup a new linux device (usually a raspberry pi)
#

if [[ $EUID -ne 0 ]]; then
    echo "[error] this script must be run as root"
    exit 1
fi

apt-get update
apt-get install -y \
    git \
    vim

