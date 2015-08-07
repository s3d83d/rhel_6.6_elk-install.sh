#!/bin/bash

function _updateFW()
{
  _port=$1
  _proto=$2
  if [[ ! `grep $_port /etc/sysconfig/iptables` ]]; then
    iptables -A INPUT -p $_proto --dport $_port -j ACCEPT
    _fwChange="yes"
  fi  
}


# Update iptables
_fw_change="no"
_updateFW 5601 tcp
_updateFW 9200 tcp
_updateFW 5050 tcp 

# Create SSL Cert
for i in `netstat -n | awk '{print $4}' | grep -v ']\|sockets\|Type\|(w/o\|Local' | awk -F: '{print $1}'`
do
  if [ $i != "127.0.0.1" ]; then
    _IP=$i
  fi
done

echo -e "${_IP}\tsyslog.localdomain\tsyslog" >> /etc/hosts
echo "${_IP}" >> /tmp/myip

_sslKey=/etc/pki/tls/private/logstash-forwarder.key
_sslCrt=/etc/pki/tls/certs/logstash-forwarder.crt
openssl req -x509 -days 3650 -batch -nodes -newkey rsa:2048 -keyout ${_sslKey} -out ${_sslCrt} -subj /CN=syslog

# Logstash post config
setfacl -m u:logstash:r /var/log/{messages,secure,yum.log}
cp ../logstash_agents/* /etc/logstash/conf.d/


