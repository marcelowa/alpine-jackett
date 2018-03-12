FROM alpine:edge

# alpine packages
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories \
  && echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
  && echo "http://dl-2.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk --update add mono libcurl curl && \
rm -rf /var/lib/apt/lists/* \
  /var/cache/apk/* \
  /usr/share/man \
  /tmp/* \
  /usr/lib/node_modules/npm/man \
  /usr/lib/node_modules/npm/doc \
  /usr/lib/node_modules/npm/html \
  /usr/lib/node_modules/npm/scripts

COPY ./ /app/

CMD /app/entry.sh