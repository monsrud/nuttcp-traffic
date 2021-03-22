#!/bin/bash

# change to the ip of another server that is running the nuttcp service
/usr/bin/nuttcp -t -T1m -R1m 127.0.0.1 
