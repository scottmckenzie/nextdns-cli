FROM alpine:latest

ARG VERSION

# https://github.com/nextdns/nextdns/wiki/Alpine-Linux-Based-Distribution#manual-install
RUN wget -O /etc/apk/keys/nextdns.pub https://repo.nextdns.io/nextdns.pub \
 && apk add --no-cache --repository https://repo.nextdns.io/apk nextdns=$VERSION

ENV NEXTDNS_ARGUMENTS="-listen :53 -log-queries -mdns -report-client-info"
ENV NEXTDNS_ID=abcdef

CMD /usr/bin/nextdns run ${NEXTDNS_ARGUMENTS} -config ${NEXTDNS_ID}
