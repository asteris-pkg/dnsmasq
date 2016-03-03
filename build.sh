#/usr/bin/env bash
set -e

DNSMASQ_VERSION=${1:-"2.75-r1"}
ALPINE_VERSION=${2:-"3.3"}

if [ "$EUID" -ne 0 ]; then
    echo "This script uses functionality which requires root privileges"
    exit 1
fi

# start the build with an empty ACI
acbuild begin

# stop build automatically
acbuildEnd() {
    export EXIT=$?
    acbuild end && exit $EXIT
}
trap acbuildEnd EXIT

# name
acbuild set-name pkg.aster.is/aci/dnsmasq

acbuild dep add pkg.aster.is/aci/alpine:${ALPINE_VERSION}
acbuild run -- apk add --no-cache "dnsmasq=${DNSMASQ_VERSION}"

# add configuration file
acbuild copy -- dnsmasq.conf /etc/dnsmasq.conf

# add ports
acbuild port add dns tcp 53

# run dnsmasq
acbuild set-exec -- /usr/sbin/dnsmasq --no-daemon

acbuild write --overwrite dnsmasq-latest-linux-amd64.aci
