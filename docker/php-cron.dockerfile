FROM creativecow/magento-php-cli

# Setup cron tab
USER root:root
RUN apk add --no-cache busybox-suid
COPY ./etc/cron/crontab /crontab
RUN crontab -u cli /crontab
RUN rm -f /crontab

# Start cron
CMD crond -l 2 -f
