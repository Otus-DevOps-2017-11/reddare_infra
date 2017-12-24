#!/bin/sh

git clone https://github.com/Otus-DevOps-2017-11/reddit.git 

cd ~/reddit && bundle install
mv /tmp/pumad.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable pumad.service
systemctl start pumad.service
