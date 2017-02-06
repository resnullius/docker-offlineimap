FROM resnullius/alpine:edge
MAINTAINER Jose-Luis Rivas <me@ghostbar.co>

RUN apk-install offlineimap && \
      addgroup -g 1000 user && \
      adduser -D -h /home/user -G user -u 1000 user

USER user
ENV HOME /home/user
VOLUME ["/Configs", "/Secrets", "/Mail"]

ENTRYPOINT ["offlineimap", "-c", "/Configs/offlineimaprc"]
