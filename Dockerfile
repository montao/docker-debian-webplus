FROM alpine:edge
RUN echo http:"//dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
  apk update && apk upgrade && apk add \
  git rust cargo make
