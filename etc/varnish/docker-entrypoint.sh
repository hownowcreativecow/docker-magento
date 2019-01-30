#!/bin/sh
set -e
varnishd -a :${VARNISH_PORT} -s malloc,${VARNISH_MEMORY} -f ${VARNISH_CONFIG} ${VARNISH_PARAMS}
sleep 1
varnishlog -q "RespStatus >= 500 or BerespStatus >= 500"
