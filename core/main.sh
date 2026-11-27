#!/bin/bash

kh_start() {

    source "$KH_PREFIX/themes/$KH_THEME.theme" 2>/dev/null

    if [ "$KH_GREETING" = "true" ]; then
        echo
        echo -e "${KH_COLOR}${BOLD}"
        echo "  _  ___ _____ _____ _   _    _    ___  "
        echo " | |/ / |_   _|_   _| | | |  / \  / _ \ "
        echo " | ' /    | |   | | | |_| | / _ \| | | |"
        echo " | . \    | |   | | |  _  |/ ___ \ |_| |"
        echo " |_|\_\   |_|   |_| |_| |_/_/   \_\___/ "
        echo -e "${RESET}"
        echo " Welcome to KITTYHAO!"
        echo
    fi

    while true; do

        if [ "$KH_SHOW_TIME" = "true" ]; then
            TIME=$(date '+%H:%M')
        else
            TIME=""
        fi

        printf "${KH_COLOR}${BOLD}[%s@KITTYHAO]${RESET} " "$KH_USERNAME"

        if [ -n "$TIME" ]; then
            printf "${DIM}%s${RESET} " "$TIME"
        fi

        printf "${KH_COLOR}❯ ${RESET}"

        if ! IFS= read -r -e input; then
            echo
            break
        fi

        read -r -a args <<< "$input"

        kh_execute "${args[@]}"

    done
}
