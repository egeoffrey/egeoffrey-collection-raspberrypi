# egeoffrey-collection-raspberrypi

This is an eGeoffrey collection package.

## Description

An All-In-One collection of the most common eGeoffrey packages running on Raspberry Pi.

## Install

To install this package, run the following command from within your eGeoffrey installation directory:
```
egeoffrey-cli install egeoffrey-collection-raspberrypi
```
After the installation, remember to run also `egeoffrey-cli start` to ensure the Docker image of the package is effectively downloaded and started.
To validate the installation, go and visit the *'eGeoffrey Admin'* / *'Packages'* page of your eGeoffrey instance. All the modules, default configuration files and out-of-the-box contents if any will be automatically deployed and made available.
## Content

The following modules are included in this package.

For each module, if requiring a configuration file to start, its settings will be listed under *'Module configuration'*. Additionally, if the module is a service, the configuration expected to be provided by each registered sensor associated to the service is listed under *'Service configuration'*.

To configure each module included in this package, once started, click on the *'Edit Configuration'* button on the *'eGeoffrey Admin'* / *'Modules'* page of your eGeoffrey instance.
- **interaction/microphone**: capture voice commands and respond accordingly
  - Module configuration:
    - *engine**: the speech-to-text engine to use
    - *speaker**: the name of the eGeoffrey notification service the speaker is running on (e.g. speaker)
    - *device*: the ALSA device the microphone is attached to (e.g. plughw:1,0)
- **notification/buzzer_raspi**: play a sound through a buzzer connected to a pin
  - Module configuration:
    - *pin**: the pin the buzzer is attached to (e.g. 20)
    - *duration**: the number of seconds the buzzer should be on when run (e.g. 3)
- **notification/buzzer_orangepi**: play a sound through a buzzer connected to a pin
  - Module configuration:
    - *pin**: the pin the buzzer is attached to (e.g. 20)
    - *duration**: the number of seconds the buzzer should be on when run (e.g. 3)
- **notification/gsm_call**: make a phone call through an attached serial device (just a few rings)
  - Module configuration:
    - *port**: the serial port the modem device is attached to (e.g. /dev/gsm)
    - *baud**: the baud rate to use for communicating with the device (e.g. 115200)
    - *to**: recipient phone number(s), comma separated (e.g. 112341231232)
- **notification/gsm_sms**: send a sms through an attached serial device
  - Module configuration:
    - *port**: the serial port the modem device is attached to (e.g. /dev/gsm)
    - *baud**: the baud rate to use for communicating with the device (e.g. 115200)
    - *to**: recipient phone number(s), comma separated (e.g. 112341231232)
- **notification/speaker**: play a notification out loud through an attached speaker
  - Module configuration:
    - *engine**: the text-to-speach engine to use (e.g. user@email.com)
    - *device*: the ALSA device the speaker is attached to (e.g. plughw:1,0)
    - *bluetooth_speaker**: weather the speaker has to be connected through bluetooth
    - *bluetooth_speaker_mac_address*: the MAC address of the bluetooth speaker (e.g. F5:B6:AB:45:63:C6)
    - *bluetooth_speaker_mac_address*: the volume to set to the speaker (e.g. 100)
- **service/ads1x15**: retrieve values from a ads1x15 analog to digital converter
  - Service configuration:
    - Mode 'pull':
      - *channel**: channel to use (e.g. 2)
      - *type**: converter type
      - *address**: the address to use (e.g. 0x49)
      - *address**: converter gain
      - *output**: what to output
- **service/bluetooth**: retrieve values from a bluetooth/BLE device
  - Module configuration:
    - *adapter**: the adapter the bluetooth device is attached to (e.g. hci0)
  - Service configuration:
    - Mode 'pull':
      - *handle**: handle address (e.g. 0x49)
      - *handle_type**: handle type
      - *mac**: the MAC address of the device (e.g. 00:11:22:33:44)
      - *format*: format of the data to return
- **service/bluetooth_discover**: discover bluetooth/BLE devices in range
  - Module configuration:
    - *adapter**: the adapter the bluetooth device is attached to (e.g. hci0)
  - Service configuration:
- **service/dht**: retrieve temperature/humidity from a DHT11/DHT22 sensor
  - Service configuration:
    - Mode 'pull':
      - *measure**: what to measure
      - *type**: dHT Sensor Type
      - *pin**: the pin the sensor is attached to (e.g. 2)
- **service/ds18b20**: retrieve temperature from a ds18b20 sensor
  - Service configuration:
    - Mode 'pull':
      - *device**: the device identifier that can be found under /sys/bus/w1/devices (e.g. 28-0000067b9508)
- **service/gpio_raspi**: read/write from a GPIO pin (raspberrypi)
  - Service configuration:
    - Mode 'push':
      - *pin**: the pin of the GPIO to use (BCM) (e.g. 2)
      - *edge_detect**: the triggering event
      - *pull_up_down*: set pull up/pull down resistor
    - Mode 'actuator':
      - *pin**: the pin of the GPIO to use (BCM) (e.g. 2)
    - Mode 'pull':
      - *pin**: the pin of the GPIO to use (BCM) (e.g. 2)
- **service/gpio_orangepi**: read/write from a GPIO pin (orangepi)
  - Service configuration:
    - Mode 'push':
      - *pin**: the pin of the GPIO to use (BCM) (e.g. 2)
      - *edge_detect**: the triggering event
    - Mode 'actuator':
      - *pin**: the pin of the GPIO to use (BCM) (e.g. 2)
    - Mode 'pull':
      - *pin**: the pin of the GPIO to use (BCM) (e.g. 2)
- **service/messagebridge**: interact with Ciseco/WirelessThings devices
  - Module configuration:
    - *port_listen**: the udp port the Messagebridge is broadcasting data to (e.g. 50140)
    - *port_send**: the udp port the Messagebridge is listening (e.g. 50141)
  - Service configuration:
    - Mode 'push':
      - *node_id**: the ID of the device (e.g. TA)
      - *measure**: the measure to take (e.g. TEMP)
    - Mode 'actuator':
      - *node_id**: the ID of the device (e.g. TA)
      - *cycle_sleep_min*: for devices with a Generic IO firmware put it to sleep for additional minutes (e.g. 5)
- **service/mysensors_serial**: interact with a MySensors serial gateway
  - Module configuration:
    - *port**: the serial port the MySensors gateway is attached to (e.g. /dev/mysensors)
    - *baud**: the baud rate to use for communicating with the device (e.g. 9600)
  - Service configuration:
    - Mode 'push':
      - *node_id**: the unique identifier of the node (e.g. 1)
      - *child_id**: each node can have several sensors attached. This is the child-id that uniquely identifies one attached sensor (e.g. 3)
      - *command**: mySensors command to trigger
      - *type**: mySensors type
    - Mode 'actuator':
      - *node_id**: the unique identifier of the node (e.g. 1)
      - *child_id**: each node can have several sensors attached. This is the child-id that uniquely identifies one attached sensor (e.g. 3)
      - *command**: mySensors command to trigger
      - *type**: mySensors type
      - *queue_size*: mandatory for sleeping nodes to define how many messages to keep in the queue and send once awake (e.g. 1)
    - Mode 'pull':
      - *node_id**: the unique identifier of the node (e.g. 1)
      - *child_id**: each node can have several sensors attached. This is the child-id that uniquely identifies one attached sensor (e.g. 3)
      - *command**: mySensors command to trigger
      - *type**: mySensors type
- **service/mysensors_mqtt**: interact with a MySensors MQTT gateway
  - Module configuration:
    - *hostname**: the MQTT hostname to connect to (e.g. egeoffrey-gateway)
    - *port**: the port of the MQTT broker (e.g. 1883)
    - *username*: the username for authenticating against the mqtt broker (e.g. username)
    - *password*: the password for authenticating against the mqtt broker (e.g. password)
    - *subscribe_topic_prefix**: the topic prefix to subscribe to (e.g. mysensors-out)
    - *publish_topic_prefix**: the topic prefix to publish data into (e.g. mysensors-in)
  - Service configuration:
    - Mode 'push':
      - *node_id**: the unique identifier of the node (e.g. 1)
      - *child_id**: each node can have several sensors attached. This is the child-id that uniquely identifies one attached sensor (e.g. 3)
      - *command**: mySensors command to trigger
      - *type**: mySensors type
    - Mode 'actuator':
      - *node_id**: the unique identifier of the node (e.g. 1)
      - *child_id**: each node can have several sensors attached. This is the child-id that uniquely identifies one attached sensor (e.g. 3)
      - *command**: mySensors command to trigger
      - *type**: mySensors type
      - *queue_size*: mandatory for sleeping nodes to define how many messages to keep in the queue and send once awake (e.g. 1)
    - Mode 'pull':
      - *node_id**: the unique identifier of the node (e.g. 1)
      - *child_id**: each node can have several sensors attached. This is the child-id that uniquely identifies one attached sensor (e.g. 3)
      - *command**: mySensors command to trigger
      - *type**: mySensors type
- **service/mysensors_ethernet**: interact with a MySensors ethernet gateway
  - Module configuration:
    - *hostname**: the IP address or hostname running the MySensors gateway (e.g. 192.168.0.230)
    - *port**: the port the gateway is listening to (e.g. 5003)
  - Service configuration:
    - Mode 'push':
      - *node_id**: the unique identifier of the node (e.g. 1)
      - *child_id**: each node can have several sensors attached. This is the child-id that uniquely identifies one attached sensor (e.g. 3)
      - *command**: mySensors command to trigger
      - *type**: mySensors type
    - Mode 'actuator':
      - *node_id**: the unique identifier of the node (e.g. 1)
      - *child_id**: each node can have several sensors attached. This is the child-id that uniquely identifies one attached sensor (e.g. 3)
      - *command**: mySensors command to trigger
      - *type**: mySensors type
      - *queue_size*: mandatory for sleeping nodes to define how many messages to keep in the queue and send once awake (e.g. 1)
    - Mode 'pull':
      - *node_id**: the unique identifier of the node (e.g. 1)
      - *child_id**: each node can have several sensors attached. This is the child-id that uniquely identifies one attached sensor (e.g. 3)
      - *command**: mySensors command to trigger
      - *type**: mySensors type
- **service/rtl_433**: interact with an attached RTL-SDR device
  - Module configuration:
    - *port_listen**: the command for running rtl_433 executable (e.g. /usr/local/bin/rtl_433)
  - Service configuration:
    - Mode 'push':
      - *filter*: filter in provided data in a key1=value1&key2=value2 format (e.g. model=Generic Sensor&id=3d c1 5c)
      - *measure*: the key whose value has to be retrieved
- **service/system**: collect telemetry information from the system
  - Service configuration:
    - Mode 'pull':
      - *measure**: the statistic to retrieve

## Contribute

If you are the author of this package, simply clone the repository, apply any change you would need and run the following command from within this package's directory to commit your changes and automatically push them to Github:
```
egeoffrey-cli commit "<comment>"
```
After taking this action, remember you still need to build (see below) the package (e.g. the Docker image) to make it available for installation.

If you are a user willing to contribute to somebody's else package, submit your PR (Pull Request); the author will take care of validating your contributation, merging the new content and building a new version.

## Build

Building is required only if you are the author of the package. To build a Docker image and automatically push it to [Docker Hub](https://hub.docker.com/r/egeoffrey/egeoffrey-collection-raspberrypi), run the following command from within this package's directory:
```
egeoffrey-cli build egeoffrey-collection-raspberrypi <amd64|arm>
```
To function properly, when running in a Docker container, the following additional configuration settings has to be added to e.g. your docker-compose.yml file (when installing through egeoffrey-cli, this is not needed since done automatically upon installation):
```
devices:
- /dev/ttyAMA0:/dev/ttyAMA0
network_mode: host
privileged: true
```

## Uninstall

To uninstall this package, run the following command from within your eGeoffrey installation directory:
```
egeoffrey-cli uninstall egeoffrey-collection-raspberrypi
```
Remember to run also `egeoffrey-cli start` to ensure the changes are correctly applied.
## Tags

The following tags are associated to this package:
```
collection raspberrypi
```

## Version

The version of this egeoffrey-collection-raspberrypi is 1.0-7 on the development branch.
