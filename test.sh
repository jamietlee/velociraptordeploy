#!/bin/bash -xe
sudo mkdir -p /velociraptor

sudo cat > /velociraptor/test.txt << EOF
[Unit]
Description=Velociraptor linux amd64
After=syslog.target network.target

[Service]
Type=simple
Restart=always
RestartSec=120
LimitNOFILE=20000
Environment=LANG=en_US.UTF-8
ExecStart=/opt/velociraptor/velociraptor-v0.6.3-linux-amd64 --config /opt/velociraptor/server.config.yaml frontend -v' >> /velociraptor/test.txt

[Install]
WantedBy=multi-user.target
EOF