#!/bin/bash

if [ $UID != '0' ]; then
   echo "You must run with sudo! Exiting..."
   exit 1
fi

chmod +x -R ./jobs/*

# Install Oracle Java 8
./jobs/install_java8.sh

