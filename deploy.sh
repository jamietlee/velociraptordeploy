#!/bin/bash -xe
sudo mkdir /opt/velociraptor
sudo cp server.config.yaml /opt/velociraptor
sudo wget https://github.com/Velocidex/velociraptor/releases/download/v0.7.0/velociraptor-v0.7.0-2-linux-amd64 -P /opt/velociraptor/
sudo chmod +x /opt/velociraptor/velociraptor-v0.7.0-2-linux-amd64

sudo touch /lib/systemd/system/velociraptor.service
#chmod u+w /lib/systemd/system/velociraptor.service

sudo cat > velociraptor.service.txt << EOF
[Unit]
Description=Velociraptor linux amd64
After=syslog.target network.target

[Service]
Type=simple
Restart=always
RestartSec=120
LimitNOFILE=20000
Environment=LANG=en_US.UTF-8
ExecStart=/opt/velociraptor/velociraptor-v0.7.0-2-linux-amd64 --config /opt/velociraptor/server.config.yaml frontend -v' >> /velociraptor/test.txt

[Install]
WantedBy=multi-user.target
EOF

#sudo systemctl daemon-reload
#sudo systemctl enable --now velociraptor