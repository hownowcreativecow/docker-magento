FROM alpine:3.6

# Install varnish
RUN apk add --no-cache elasticsearch

# Create user
RUN addgroup -g 1000 -S elasticsearch \
    && adduser -u 1000 -D -S -G elasticsearch elasticsearch

# Copy config files
COPY ./etc/elasticsearch/elasticsearch.yml /usr/share/java/elasticsearch/config/elasticsearch.yml
COPY ./etc/elasticsearch/log4j2.properties /usr/share/java/elasticsearch/config/log4j2.properties

# Fix permissions
RUN mkdir -p /usr/share/java/elasticsearch/data
RUN mkdir -p /usr/share/java/elasticsearch/logs
RUN chown -R elasticsearch:elasticsearch /usr/share/java/elasticsearch

# Setup container
WORKDIR /usr/share/java/elasticsearch
USER elasticsearch:elasticsearch
CMD ["/bin/sh", "/usr/share/java/elasticsearch/bin/elasticsearch"]
