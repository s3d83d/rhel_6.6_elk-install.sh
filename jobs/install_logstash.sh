
cd /opt

wget https://download.elastic.co/logstash/logstash/packages/centos/logstash-1.5.3-1.noarch.rpm

rpm -ivh logstash-1.5.3-1.noarch.rpm

setfacl -m u:logstash:r /var/log/{messages,secure,yum.log}

cp logstash_agents/logstash.conf /etc/logstash/conf.d/ && chmod 644 /etc/logstash/conf.d/*

