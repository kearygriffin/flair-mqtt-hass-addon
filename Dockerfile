ARG BUILD_FROM=homeassistant/amd64-base:latest
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add --no-cache python3 py3-pip git
RUN pip install pip install git+git://github.com/flair-systems/flair-api-client-py.git paho-mqtt python-slugify


WORKDIR /
COPY start.sh /app/start.sh
COPY vents_bridge.py /app/vents_bridge.py 
ENTRYPOINT ["/app/start.sh"]

LABEL io.hass.version="VERSION" io.hass.type="addon" io.hass.arch="armhf|aarch64|i386|amd64"
