FROM alpine:3.6

# Install varnish
RUN apk add --no-cache elasticsearch

# Create user
RUN addgroup -g 1000 -S elasticsearch \
    && adduser -u 1000 -D -S -G elasticsearch elasticsearch

# Copy config files
COPY ./etc/elasticsearch/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml.tmp
RUN cat /usr/share/elasticsearch/config/elasticsearch.yml.tmp >> /usr/share/elasticsearch/config/elasticsearch.yml\
    && rm -f /usr/share/elasticsearch/config/elasticsearch.yml

# Fix permissions
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch

# Setup container
WORKDIR /usr/share/elasticsearch
USER elasticsearch:elasticsearch
#CMD ["/usr/share/elasticsearch/bin/elasticsearch"]
