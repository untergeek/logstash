#!/bin/sh

chown -R logstash:logstash /usr/lib/logstash
chown logstash /var/log/logstash
chown logstash:logstash /var/lib/logstash
chmod 0644 /etc/logrotate.d/logstash
