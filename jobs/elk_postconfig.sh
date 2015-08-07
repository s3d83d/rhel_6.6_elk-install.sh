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

_fw_change="no"
_updateFW 5601 tcp
_updateFW 9200 tcp
