#!/bin/sh

SETUP_DIR="./docker"

if [ -n "$BLUETOOTH_SPEAKER" -a "$BLUETOOTH_SPEAKER" = "1" ]; then
    $SETUP_DIR/setup_bluetooth_audio.sh
    $SETUP_DIR/start_bluetooth.sh
fi
    
$SETUP_DIR/start_pulseaudio.sh

if [ -n "$BLUETOOTH_SPEAKER" -a "$BLUETOOTH_SPEAKER" = "1" ]; then
    $SETUP_DIR/connect_bluetooth_speakers.exp $SPEAKER_MAC_ADDRESS
fi

if [ -n "$SPEAKER_VOLUME" ]; then
    $SETUP_DIR/set_volume.sh "$SPEAKER_VOLUME"
fi
