#!/bin/bash

killall -9 pulseaudio
/usr/bin/pulseaudio -D --system --realtime --disallow-exit --no-cpu-limit
