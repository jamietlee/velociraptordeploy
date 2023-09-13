#!/bin/bash -xe
sudo mkdir -p /velociraptor
sudo touch /velociraptor/test.txt
echo '[Unit]' >> /velociraptor/test.txt
echo 'Description=Velociraptor linux amd64' >> /velociraptor/test.txt
echo 'After=syslog.target network.target' >> /velociraptor/test.txt
echo '\n' >> /velociraptor/test.txt
echo '[Service]' >> /velociraptor/test.txt
echo 'Type=simple' >> /velociraptor/test.txt
echo 'Restart=always' >> /velociraptor/test.txt
echo 'RestartSec=120' >> /velociraptor/test.txt
echo 'LimitNOFILE=20000' >> /velociraptor/test.txt
echo 'Environment=LANG=en_US.UTF-8' >> /velociraptor/test.txt
echo 'ExecStart=/opt/velociraptor/velociraptor-v0.6.3-linux-amd64 --config /opt/velociraptor/server.config.yaml frontend -v' >> /velociraptor/test.txt
echo '\n' >> /velociraptor/test.txt
echo '[Install]' >> /velociraptor/test.txt
echo 'WantedBy=multi-user.target' >> /velociraptor/test.txt