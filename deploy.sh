#!/bin/bash -xe
sudo mkdir /opt/velociraptor
sudo wget https://github.com/Velocidex/velociraptor/releases/download/v0.7.0/velociraptor-v0.7.0-2-linux-amd64 -P /opt/velociraptor/
sudo chmod +x /opt/velociraptor/velociraptor-v0.7.0-2-linux-amd64

sudo touch /lib/systemd/system/velociraptor.service
sudo bash -c 'echo [Unit] >> /lib/systemd/system/velociraptor.service'
sudo bash -c 'echo Description=Velociraptor linux amd64 >> /lib/systemd/system/velociraptor.service'
sudo bash -c 'echo After=syslog.target network.target >> /lib/systemd/system/velociraptor.service'
sudo bash -c 'echo \n >> /lib/systemd/system/velociraptor.service'
sudo bash -c 'echo [Service] >> /lib/systemd/system/velociraptor.service'
sudo bash -c 'echo Type=simple >> /lib/systemd/system/velociraptor.service'
sudo bash -c 'echo Restart=always >> /lib/systemd/system/velociraptor.service'
sudo bash -c 'echo RestartSec=120 >> /lib/systemd/system/velociraptor.service'
sudo bash -c 'echo LimitNOFILE=20000 >> /lib/systemd/system/velociraptor.service'
sudo bash -c 'echo Environment=LANG=en_US.UTF-8 >> /lib/systemd/system/velociraptor.service'
sudo bash -c 'echo ExecStart=/opt/velociraptor/velociraptor-v0.6.3-linux-amd64 --config /opt/velociraptor/server.config.yaml frontend -v >> /lib/systemd/system/velociraptor.service'
sudo bash -c 'echo \n >> /lib/systemd/system/velociraptor.service'
sudo bash -c 'echo [Install] >> /lib/systemd/system/velociraptor.service'
sudo bash -c 'echo WantedBy=multi-user.target >> /lib/systemd/system/velociraptor.service'

sudo systemctl daemon-reload
sudo systemctl enable --now velociraptor