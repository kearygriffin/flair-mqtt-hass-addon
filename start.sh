#!/usr/bin/env bashio

CLIENT_ID=$(bashio::config 'client_id')
if [ "$CLIENT_ID" == "null" ]; then CLIENT_ID=""; fi
CLIENT_SECRET=$(bashio::config 'client_secret')
if [ "$CLIENT_SECRET" == "null" ]; then CLIENT_SECRET=""; fi

HOUSE_ID=$(bashio::config 'house_id')
if [ "$HOUSE_ID" == "null" ]; then HOUSE_ID=""; fi


SERVICES_MQTT_HOST=$(bashio::services "mqtt" "host")
SERVICES_MQTT_PASSWORD=$(bashio::services "mqtt" "password")
SERVICES_MQTT_PORT=$(bashio::services "mqtt" "port")
SERVICES_MQTT_USERNAME=$(bashio::services "mqtt" "username")

CONFIG_MQTT_HOST=$(bashio::config 'mqtt_host')
if [ "$CONFIG_MQTT_HOST" == "null" ]; then CONFIG_MQTT_HOST=""; fi
CONFIG_MQTT_PORT=$(bashio::config 'mqtt_port')
if [ "$CONFIG_MQTT_PORT" == "null" ]; then CONFIG_MQTT_PORT=""; fi
CONFIG_MQTT_USERNAME=$(bashio::config 'mqtt_username')
if [ "$CONFIG_MQTT_USERNAME" == "null" ]; then CONFIG_MQTT_USERNAME=""; fi
CONFIG_MQTT_PASSWORD=$(bashio::config 'mqtt_password')
if [ "$CONFIG_MQTT_PASSWORD" == "null" ]; then CONFIG_MQTT_PASSWORD=""; fi

MQTT_HOST=${CONFIG_MQTT_HOST:=$SERVICES_MQTT_HOST}
MQTT_PORT=${CONFIG_MQTT_PORT:=$SERVICES_MQTT_PORT}
MQTT_USERNAME=${CONFIG_MQTT_USERNAME:=$SERVICES_MQTT_USERNAME}
MQTT_PASSWORD=${CONFIG_MQTT_PASSWORD:=$SERVICES_MQTT_PASSWORD}

CONFIG_HA_TOPIC=$(bashio::config 'ha_topic')
if [ "$CONFIG_HA_TOPIC" == "null" ]; then CONFIG_HA_TOPIC=""; fi

CONFIG_FLAIR_TOPIC=$(bashio::config 'ha_topic')
if [ "$CONFIG_FLAIR_TOPIC" == "null" ]; then CONFIG_FLAIR_TOPIC=""; fi

HA_TOPIC=${CONFIG_HA_TOPIC:=homeassistant} 
FLAIR_TOPIC=${CONFIG_FLAIR_TOPIC:=flair} 

if [[ "$MQTT_HOST" == "" || "$MQTT_PORT" == "" || "$MQTT_PASSWORD" == "" || "$MQTT_USERNAME" == "" ]]; then
  echo "Please install Mosqitto broker, or configure MQTT host information"
  exit -1
f
fi

if [[ "$CLIENT_SECRET" == "" || "$CLIENT_ID" == "" ]]; then
  echo "Missing CLIENT_SECRET, CLIENT_ID"
  exit -1
fi

python3 /app/vents_bridge.py -id "$HOUSE_ID" --topic $FLAIR_TOPIC -H $HA_TOPIC -cid $CLIENT_ID -cs $CLIENT_SECRET -b "$MQTT_HOST" -p $MQTT_PORT -u "$MQTT_USERNAME" -pw "$MQTT_PASSWORD" -l None 

