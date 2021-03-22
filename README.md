# nuttcp-traffic


Downloads and builds nuttcp from https://www.nuttcp.net/.  Adds client/server systemd services for it and creates an installable deb package.  Used when needing a little bit of traffic flowing over a network. Run a client/server on two hosts and have each host's client point to the server on the opposite host. 

The file /home/nuttcp/send_traffic.sh can be edited to change:

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

If your network goes down for a long period of time when the client service is running, it will eventually stop traffic.  I use a short duration -T and run the client in a loop. That way, it restarts every x and traffic will resume again. 

After you finish installing the .deb, you need to enable and start the following services:

Enable the services:

- systemctl enable nuttcp.socket
- systemctl enable nuttcp_server@.service
- systemctl enable nuttcp_client.service

Edit /home/nuttcp/send_traffic.sh to your liking.

Start the services:

- systemctl start nuttcp.socket
- DO NOT START nuttcp_server@.service
- systemctl start nuttcp_client.service




