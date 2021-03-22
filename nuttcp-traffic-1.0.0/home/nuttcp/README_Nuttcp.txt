Installation

1) Add a user nuttcp
2) Copy nuttcp_client_service.sh  send_traffic.sh to /home/nuttcp/
2) Copy the nuttcp_client.service file to /etc/systemd/system
3) systemctl enable nuttcp_client
4) systemctl start nuttcp_client

The file send traffic can be edited to change:

    - the amount of time traffic is sent :
        As examples:

        - can be -T1s for one second
        - can be -T1m for one minute
        - can be -T1h for one hour
        - can be -T1d for one day

    - the amount of traffic sent
        As examples:
        - can be -R1m for 1 Mbps
        - can be -R1g for 1 Gbps

    - the destination of traffic sent

    - the max segment size (default 1442)
      -M1442 or less


/usr/bin/nuttcp -t -T1m -R1m 10.80.0.79

