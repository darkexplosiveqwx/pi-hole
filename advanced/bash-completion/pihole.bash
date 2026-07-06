#!/bin/bash
#
# Bash completion script for pihole
#
_pihole() {
    local cur prev prev2 opts opts_lists opts_debug opts_logging opts_query opts_networkflush
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    prev2="${COMP_WORDS[COMP_CWORD-2]}"

    case "${prev}" in
        "pihole")
            opts="allow allow-regex allow-wild deny debug disable enable flush help logging query regex reloaddns reloadlists setpassword status tail updateGravity version wildcard networkflush api"
            mapfile -t COMPREPLY < <(compgen -W "${opts}" -- "${cur}")
        ;;
        "allow"|"deny"|"wildcard"|"regex"|"allow-regex"|"allow-wild")
            opts_lists="\not \--delmode \--quiet \--list \--help"
            mapfile -t COMPREPLY < <(compgen -W "${opts_lists}" -- "${cur}")
        ;;
        "debug")
            opts_debug="-a"
            mapfile -t COMPREPLY < <(compgen -W "${opts_debug}" -- "${cur}")
        ;;
        "logging")
            opts_logging="on off 'off noflush'"
            mapfile -t COMPREPLY < <(compgen -W "${opts_logging}" -- "${cur}")
        ;;
        "query")
            opts_query="--partial --all"
            mapfile -t COMPREPLY < <(compgen -W "${opts_query}" -- "${cur}")
        ;;
        "networkflush")
            opts_networkflush="--arp"
            mapfile -t COMPREPLY < <(compgen -W "${opts_networkflush}" -- "${cur}")
        ;;
        *)
        return 1
        ;;
    esac
    return 0
}
complete -F _pihole pihole
