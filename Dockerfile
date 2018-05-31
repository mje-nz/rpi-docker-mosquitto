FROM alpine:3.7

RUN apk --no-cache add mosquitto

EXPOSE 1883

ENTRYPOINT ["/usr/sbin/mosquitto"]
