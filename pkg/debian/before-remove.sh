#!/bin/sh

if [ $1 = "remove" ]; then
  if [ ! -f "/lib/systemd/system/logstash.service" ]; then
    service logstash stop >/dev/null 2>&1 || true
  else
    /bin/systemctl stop logstash >/dev/null 2>&1 || true
    if [ -f "/lib/systemd/system/logstash-prestart.sh" ]; then
      rm /lib/systemd/system/logstash-prestart.sh
    fi

    if [ -f "/lib/systemd/system/logstash.service" ]; then
      rm /lib/systemd/system/logstash.service
    fi
  fi

  if getent passwd logstash >/dev/null ; then
    userdel logstash
  fi

  if getent group logstash >/dev/null ; then
    groupdel logstash
  fi
fi
