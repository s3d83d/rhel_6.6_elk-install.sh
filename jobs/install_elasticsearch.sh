#!/bin/bash

rpm --import https:////packages.elastic.co/GPG-KEY-elasticsearch

echo -e "[elasticsearch-1.7]
name=Elasticsearch repository for 1.7.x packages
baseurl=http://packages.elastic.co/elasticsearch/1.7/centos
gpgcheck=1
gpgkey=http://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1" > /etc/yum.repos.d/elasticsearch1.7.repo

yum install -y elasticsearch

chkconfig --add elasticsearch
