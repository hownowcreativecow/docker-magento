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

# Copy entrypoint
RUN printf "#!/bin/sh\n\
set -e\n\
varnishd -a :${VARNISH_PORT} -s malloc,${VARNISH_MEMORY} -f ${VARNISH_CONFIG} ${VARNISH_PARAMS}\n\
sleep 1\n\
varnishlog -q \"RespStatus >= 500 or BerespStatus >= 500\"\n\
" > /docker-entrypoint.sh \
    && chmod +x /docker-entrypoint.sh

# Setup container
ENTRYPOINT ["/docker-entrypoint.sh"]
