#!/bin/bash

## Run copy job and record network traffic
sshpass -p 'vagrant' ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null vagrant@192.168.2.2 'echo "dies ist ein testfile" > testfile.txt ; sudo apt-get install sshpass ; bash -c "nohup sudo tcpdump -i eth1 -w /tmp/scp.pcap dst 192.168.2.3 and dst port 22 &"; sshpass -p "vagrant" scp testfile.txt 192.168.2.3:/tmp/ ; sleep 2 ; sudo pkill -SIGINT tcpdump'

### Copy PCAP to local host
sshpass -p 'vagrant' scp -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null vagrant@192.168.2.2:/tmp/scp.pcap /tmp/

### Analyse scp.pcap
wireshark /tmp/scp.pcap
