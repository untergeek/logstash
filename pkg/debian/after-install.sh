#!/bin/sh

chown -R logstash:logstash /opt/logstash
chown logstash /var/log/logstash
chown logstash:logstash /var/lib/logstash
chmod 755 /etc/logstash
