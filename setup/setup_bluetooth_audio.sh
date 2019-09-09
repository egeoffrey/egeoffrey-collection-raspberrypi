#!/bin/bash

append() {
    STRING=$1
    FILE=$2
    grep -qxF "$STRING" $FILE || echo -e "$STRING" >> $FILE
}

append "default-server = /var/run/pulse/native" /etc/pulse/client.conf
append "autospawn = no" /etc/pulse/client.conf
append "flat-volumes = no" /etc/pulse/daemon.conf
append "### Bluetooth Support" /etc/pulse/system.pa
append ".ifexists module-bluetooth-discover.so\nload-module module-bluetooth-discover\n.endif" /etc/pulse/system.pa
append ".ifexists module-bluetooth-policy.so\nload-module module-bluetooth-policy\n.endif" /etc/pulse/system.pa
append "load-module module-switch-on-connect" /etc/pulse/system.pa
append "load-module module-card-restore" /etc/pulse/system.pa
usermod -a -G pulse-access root
