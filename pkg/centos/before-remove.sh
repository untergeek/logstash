if [ $1 -eq 0 ]; then
  if [ ! -f "/etc/systemd/system/logstash.service" ]; then
    /sbin/stop logstash >/dev/null 2>&1 || true
    /sbin/service logstash stop >/dev/null 2>&1 || true
    /sbin/chkconfig --del logstash
  else
    systemctl stop logstash >/dev/null 2>&1 || true
    if [ -f "/etc/systemd/system/logstash-prestart.sh" ]; then
      rm /etc/systemd/system/logstash-prestart.sh
    fi

    if [ -f "/etc/systemd/system/logstash.service" ]; then
      rm /etc/systemd/system/logstash.service
    fi
  fi
  if getent passwd logstash >/dev/null ; then
    userdel logstash
  fi

  if getent group logstash > /dev/null ; then
    groupdel logstash
  fi
  rm -f /etc/logstash/startup.options
  rm -f /etc/logstash/jvm.options
fi
