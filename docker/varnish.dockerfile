FROM alpine:3.7

# Setup environment
ENV VARNISH_CONFIG /etc/varnish/default.vcl
ENV VARNISH_MEMORY 256m
ENV VARNISH_PARAMS -p default_ttl=3600 -p default_grace=3600 -p feature=+esi_ignore_https -p feature=+esi_disable_xml_check
ENV VARNISH_PORT 80

# Install varnish
RUN apk add --no-cache varnish

# Copy config files
COPY ./etc/varnish/default.vcl /etc/varnish/default.vcl
COPY ./etc/varnish/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod u+x /usr/local/bin/docker-entrypoint

# Setup container
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
