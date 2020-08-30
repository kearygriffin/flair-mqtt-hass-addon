# Home Assistant Flair MQTT Add-on



## Summary
Exposes Flair Vents and Puck as devices to Home Assistant via MQTT discovery.

This is a wrapper (plus small modifications) based on original Flair MQTT vent control (for openHAB) originally coded by NickWaterton: https://github.com/NickWaterton/Flair-Vents-MQTT-Interface 

## Configuration
client_id and client_secret are required (see below)

All other configuration properties are optional.  If no MQTT properties are set, the default installed MQTT service will be used.

### Optional configuration settings
* house_id
  * option flair house_id.  First house found is used by default if not present
* mqtt_host
* mqtt_port
* mqtt_username
* mqtt_password
  * MQTT configuration override.  Uses installed MQTT service by default if available.
* ha_topic
  * homeassistant MQTT discovery topic.
  * default: homeassistant 
* flair_topic
  * MQTT topic for sensor value messages
  * default: flair

### Prerequisites

1.  MQTT integration must be installed, and auto discovery enabled
2.  Requires CLIENT_ID and CLIENT_SECRET from flair.

You must request the CLIENT_ID and CLIENT_SECRET from flair.  See:  https://support.flair.co/hc/en-us/articles/360000523252-Does-Flair-have-an-API-
 
