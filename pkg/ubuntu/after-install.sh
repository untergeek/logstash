#!/bin/sh

chown -R logstash:logstash /usr/share/logstash
chown logstash /var/log/logstash
chown logstash:logstash /var/lib/logstash
chmod 0644 /etc/logrotate.d/logstash
ln -s /usr/share/logstash/config/settings /etc/logstash/config/settings
ln -s /usr/share/logstash/config/jvm.options /etc/logstash/config/jvm.options
/usr/share/logstash/bin/system-install
