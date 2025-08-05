FROM alpine:latest

ARG VERSION

# https://github.com/nextdns/nextdns/wiki/Alpine-Linux-Based-Distribution#manual-install
# openrc is required for nextdns to install /etc/nextdns.conf
RUN wget -O /etc/apk/keys/nextdns.pub https://repo.nextdns.io/nextdns.pub \
 && apk add --no-cache openrc \
 && apk add --no-cache --repository https://repo.nextdns.io/apk nextdns=$VERSION \
 && apk del --no-cache openrc

CMD /usr/bin/nextdns run -config-file /etc/nextdns.conf
