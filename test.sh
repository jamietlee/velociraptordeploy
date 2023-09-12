#!/bin/bash -xe
sudo mkdir /~/velociraptor
sudo touch /~/velociraptor/test.txt
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