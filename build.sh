#!/bin/bash

NUTTCP_VERSION="8.2.2"

ARCH=`dpkg --print-architecture`

if [ -e Debian/nuttcp-traffic/debian/files/usr/sbin/nuttcp ]; then
    rm Debian/nuttcp-traffic/debian/files/usr/sbin/nuttcp
fi  

if [ -e nuttcp-traffic_1.0.0_amd64.deb ]; then
    rm nuttcp-traffic_1.0.0_amd64.deb
fi

wget -O nuttcp-${NUTTCP_VERSION}.tar.bz2 http://nuttcp.net/nuttcp/nuttcp-${NUTTCP_VERSION}.tar.bz2
bunzip2 nuttcp-${NUTTCP_VERSION}.tar.bz2
tar -xvf nuttcp-${NUTTCP_VERSION}.tar
rm -f nuttcp-${NUTTCP_VERSION}.tar 2>&1 > /dev/null
cd nuttcp-${NUTTCP_VERSION}

make

retVal=$?
if [ $retVal -ne 0 ]; then
    echo "Build failure"
    exit $retVal
fi

cd ..

mkdir -p nuttcp-traffic-1.0.0/usr/sbin

cp nuttcp-${NUTTCP_VERSION}/nuttcp-${NUTTCP_VERSION} nuttcp-traffic-1.0.0/usr/sbin/nuttcp

rm -Rf nuttcp-8.2.2

cat << EOF  > nuttcp-traffic-1.0.0/DEBIAN/control
Package: nuttcp-traffic
Version: 1.0.0
Priority: optional
Architecture: ${ARCH} 
Maintainer: unknown <marshall@theonsruds.com>
Description: Systemd services for nuttcp client and server
EOF

dpkg-deb --build nuttcp-traffic-1.0.0
dpkg-name nuttcp-traffic-1.0.0.deb

