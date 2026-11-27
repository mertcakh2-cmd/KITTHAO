#!/bin/bash

kh_theme_list() {
    echo "Available themes:"
    for theme in "$KH_PREFIX"/themes/*.theme; do
        [ -f "$theme" ] && basename "$theme" .theme
    done
}

kh_theme_set() {
    local theme="$1"
    local file="$KH_PREFIX/themes/$theme.theme"

    if [ ! -f "$file" ]; then
        echo "Theme not found: $theme"
        return 1
    fi

    KH_THEME="$theme"

    if grep -q '^KH_THEME=' "$CONFIG_FILE"; then
        sed -i "s/^KH_THEME=.*/KH_THEME=$theme/" "$CONFIG_FILE"
    else
        echo "KH_THEME=$theme" >> "$CONFIG_FILE"
    fi

    source "$file"
    echo "Theme changed to $theme"
}
