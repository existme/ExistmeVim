#!/bin/bash -e

# currently not supported mingw

TEST_HOST=8.8.8.8
IFNAME=`ip route get ${TEST_HOST} |head -n1 | cut -d ' ' -f5`
GW=`ip route get ${TEST_HOST} |head -n1 | cut -d ' ' -f3`

script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
cd ${script_dir}

# And make sure we clean up when we're done
function clear_work_dir {
    ${SUDO} ip link set dev lkl_ptt1 down &> /dev/null || true
    ${SUDO} ip tuntap del dev lkl_ptt1 mode tap &> /dev/null || true
    ${SUDO} ip link del dev lkl_vtap0 type macvtap &> /dev/null || true
}

trap clear_work_dir EXIT

echo "== TAP (LKL net) tests =="
if [ -c /dev/net/tun ]; then
    ${SUDO} ip link set dev lkl_ptt1 down || true
    ${SUDO} ip tuntap del dev lkl_ptt1 mode tap || true
    ${SUDO} ip tuntap add dev lkl_ptt1 mode tap user $USER
    ${SUDO} ip link set dev lkl_ptt1 up
    ${SUDO} ip addr add dev lkl_ptt1 192.168.14.1/24

    ./net-test tap lkl_ptt1 192.168.14.1 192.168.14.2 24

    ${SUDO} ip link set dev lkl_ptt1 down
    ${SUDO} ip tuntap del dev lkl_ptt1 mode tap
fi

if ping -c1 -w1 $GW &>/dev/null; then
    DST=$GW
elif ping -c1 -w1 ${TEST_HOST} &>/dev/null; then
    DST=${TEST_HOST}
fi

if [ -z $LKL_TEST_DHCP ] ; then
    echo "\$LKL_TEST_DHCP is not configured. skipped dhcp client test"
else
if ! [ -z $DST ]; then
    echo "== RAW socket (LKL net) tests =="
    ${SUDO} ip link set dev ${IFNAME} promisc on
    ${SUDO} ./net-test raw ${IFNAME} ${DST} dhcp
    ${SUDO} ip link set dev ${IFNAME} promisc off

    echo "== macvtap (LKL net) tests =="
    ${SUDO} ip link add link ${IFNAME} name lkl_vtap0 type macvtap mode passthru
    if ls /dev/tap* > /dev/null 2>&1 ; then
	${SUDO} ip link set dev lkl_vtap0 up
	${SUDO} chown ${USER} `ls /dev/tap*`
	./net-test macvtap `ls /dev/tap*` $DST dhcp
    fi
fi
fi

# we disabled this DPDK test because it's unlikely possible to describe
# a generic set of commands for all environments to test with DPDK.  users
# may customize those test commands for your host.
if false ; then
    echo "== DPDK (LKL net) tests =="
    ${SUDO} ./net-test dpdk dpdk0 192.168.15.1 192.168.15.2 24
fi
