#!/bin/bash

kh_help() {
    cat <<'EOF'

 KITTYHAO COMMAND CENTER

 General:
   help                  Show commands
   about                 About KITTYHAO
   clear                 Clear terminal
   exit                  Exit KITTYHAO

 Themes:
   theme list            List themes
   theme set NAME        Change theme

 Packages:
   pkg install NAME      Install package
   pkg remove NAME       Remove package
   pkg search NAME       Search packages
   pkg update            Update repositories
   pkg upgrade           Upgrade packages
   pkg list              Installed packages
   pkg info NAME         Package information
   pkg clean             Clean package cache

 Settings:
   config                Edit configuration

EOF
}

kh_about() {
    echo "KITTYHAO Terminal"
    echo "Version: $KH_VERSION"
    echo "Debian Terminal Environment"
    echo "Powered by Bash"
}

kh_execute() {
    case "$1" in
        help) kh_help ;;
        about) kh_about ;;
        clear) command clear ;;

        theme)
            case "$2" in
                list) kh_theme_list ;;
                set) kh_theme_set "$3" ;;
                *) echo "Usage: theme list | theme set NAME" ;;
            esac
            ;;

        pkg)
            case "$2" in
                install) shift 2; kh_pkg_install "$@" ;;
                remove) shift 2; kh_pkg_remove "$@" ;;
                search) shift 2; kh_pkg_search "$@" ;;
                update) kh_pkg_update ;;
                upgrade) kh_pkg_upgrade ;;
                list) kh_pkg_list ;;
                info) shift 2; kh_pkg_info "$@" ;;
                clean) kh_pkg_clean ;;
                *) echo "Unknown package command" ;;
            esac
            ;;

        config)
            "${EDITOR:-nano}" "$KH_CONFIG/kittyhao.conf"
            ;;

        exit)
            exit 0
            ;;

        "")
            ;;

        *)
            command "$@"
            ;;
    esac
}
