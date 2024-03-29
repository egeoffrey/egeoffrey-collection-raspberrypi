ARG SDK_VERSION
ARG ARCHITECTURE
FROM egeoffrey/egeoffrey-sdk-raspbian:${SDK_VERSION}-${ARCHITECTURE}
RUN apt-get update && apt-get install -y flac alsa-utils pocketsphinx sox pulseaudio mpg123 libttspico-utils bluetooth bluez bluez-tools pulseaudio-module-bluetooth rtl-sdr librtlsdr-dev python-opencv && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade "pip < 21.0"
RUN pip install SpeechRecognition RPi.GPIO OPi.GPIO pyserial gTTS Adafruit-ADS1x15 imutils
RUN pip install Adafruit-Python-DHT --install-option="--force-pi2"
ENV RTL_433_VERSION=18.05
RUN wget https://github.com/merbanan/rtl_433/archive/$RTL_433_VERSION.zip    && unzip $RTL_433_VERSION.zip    && rm -f $RTL_433_VERSION.zip    && cd rtl_433-$RTL_433_VERSION/    && mkdir build    && cd build    && cmake ../    && make    && make install    && make clean
RUN ln /dev/null /dev/raw1394
COPY . $WORKDIR
