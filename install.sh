#!/bin/bash

if [ $UID != '0' ]; then
   echo "You must run with sudo! Exiting..."
   exit 1
fi

chmod +x -R ./jobs/*

# Install Oracle Java 8
./jobs/install_java8.sh

# Install ElasticSearch 1.7.x
./jobs/install_elasticsearch.sh

# Install Kibana 4.1.x
./jobs/install_kibana.sh

# Install Logstash
./jobs/install_logstash.sh

# Post Config
./jobs/elk_postconfig.sh
