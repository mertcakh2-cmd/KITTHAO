#!/bin/bash

CONFIG_FILE="$KH_CONFIG/kittyhao.conf"

if [ ! -f "$CONFIG_FILE" ]; then
    cp "$KH_PREFIX/config/kittyhao.conf" "$CONFIG_FILE"
fi

source "$CONFIG_FILE"

KH_NAME="${KH_NAME:-KITTYHAO}"
KH_VERSION="${KH_VERSION:-1.0.0}"
KH_THEME="${KH_THEME:-default}"
KH_USERNAME="${KH_USERNAME:-$USER}"
KH_SHOW_TIME="${KH_SHOW_TIME:-true}"
KH_GREETING="${KH_GREETING:-true}"
