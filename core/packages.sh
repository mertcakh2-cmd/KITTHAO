#!/bin/bash

kh_pkg_install() {
    sudo apt install -y "$@"
}

kh_pkg_remove() {
    sudo apt remove -y "$@"
}

kh_pkg_search() {
    apt search "$@"
}

kh_pkg_update() {
    sudo apt update
}

kh_pkg_upgrade() {
    sudo apt upgrade -y
}

kh_pkg_list() {
    dpkg-query -W -f='${binary:Package}\n'
}

kh_pkg_info() {
    apt show "$@"
}

kh_pkg_clean() {
    sudo apt autoremove -y
    sudo apt clean
}
