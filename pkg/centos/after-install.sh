# /sbin/chkconfig --add logstash

chown -R logstash:logstash /usr/share/logstash
chown logstash /var/log/logstash
chown logstash:logstash /var/lib/logstash
chmod 0644 /etc/logrotate.d/logstash
ln -s /usr/share/logstash/config/startup.options /etc/logstash/startup.options
ln -s /usr/share/logstash/config/jvm.options /etc/logstash/jvm.options
/usr/share/logstash/bin/system-install
