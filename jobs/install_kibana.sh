#!/bin/bash

cd /opt

wget https://download.elastic.co/kibana/kibana/kibana-4.1.1-linux-x64.tar.gz

tar xvzf kibana-4.1.1-linux-x64.tar.gz
mv kibana-4.1.1-linux-x64 kibana4

cp kibana_init/kibana /etc/init.d && chmod 755 /etc/init.d/kibana
chkconfig --add kibana
service kibana start

