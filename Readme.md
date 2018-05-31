# Docker Mosquitto image for Raspberry Pi (or other armhf)
[![](https://images.microbadger.com/badges/image/mjenz/rpi-mosquitto.svg)](https://microbadger.com/images/mjenz/rpi-mosquitto "Get your own image badge on microbadger.com")

This image contains [Eclipse Mosquitto](http://mosquitto.org) 1.4.15, in an Alpine base image.
It's based on [foertel/armhf-alpine-mosquitto](https://github.com/foertel/armhf-alpine-mosquitto).

To run:
```
docker run -p 1883:1883 mjenz/rpi-mosquitto
```

To install as a service:
```
docker run -p 1883:1883 --detach --restart unless-stopped --name mosquitto mjenz/rpi-mosquitto
```

