#!/bin/bash

killall pulseaudio
/usr/bin/pulseaudio -D --system --realtime --disallow-exit --no-cpu-limit
