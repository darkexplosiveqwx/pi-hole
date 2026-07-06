#!/usr/bin/env sh
# Pi-hole: A black hole for Internet advertisements
# (c) 2017 Pi-hole, LLC (https://pi-hole.net)
# Network-wide ad blocking via your own hardware.
#
# Show version numbers
#
# This file is copyright under the latest version of the EUPL.
# Please see LICENSE file for your rights under this license.

# shellcheck source=./advanced/Scripts/utils.sh
. /usr/libexec/pihole/utils.sh

# Load the versions file installed by the RPM
cachedVersions="/usr/share/pihole/versions"

if [ -f "${cachedVersions}" ]; then
    loadVersionFile "${cachedVersions}"
else
    echo "Could not find /usr/share/pihole/versions."
    exit 1
fi

main() {
    echo "Core"
    echo "    Version is ${CORE_VERSION:=N/A}"
    echo "    Branch is ${CORE_BRANCH:=N/A}"
    echo "    Hash is ${CORE_HASH:=N/A}"
    echo "Web"
    echo "    Version is ${WEB_VERSION:=N/A}"
    echo "    Branch is ${WEB_BRANCH:=N/A}"
    echo "    Hash is ${WEB_HASH:=N/A}"
    echo "FTL"
    echo "    Version is ${FTL_VERSION:=N/A}"
    echo "    Branch is ${FTL_BRANCH:=N/A}"
    echo "    Hash is ${FTL_HASH:=N/A}"
}

main
