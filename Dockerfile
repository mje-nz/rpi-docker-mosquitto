FROM arm32v6/alpine:3.6

RUN apk --no-cache add mosquitto

EXPOSE 1883

ENTRYPOINT ["/usr/sbin/mosquitto"]
