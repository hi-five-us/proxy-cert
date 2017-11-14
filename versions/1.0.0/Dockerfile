FROM alpine

RUN apk add --no-cache certbot docker bash

VOLUME /etc/letsencrypt
VOLUME /var/lib/letsencrypt

COPY scripts/crontab /var/spool/cron/crontabs/certbot-renew
COPY scripts/restart-proxy.sh /restart-proxy.sh

RUN chmod +x /restart-proxy.sh

## Example: Register a new certificate
# ENTRYPOINT /usr/bin/certbot certonly --standalone -d
# CMD example.com
# ## Multi-domain certificate
# CMD example.com -d example.org

## Example: Register a new certificate (full command)
# ENTRYPOINT []
# CMD /usr/bin/certbot certonly --standalone -d example.com

## Example: Renew certificates now
# CMD /usr/bin/certbot renew --no-self-upgrade

ENTRYPOINT []

# BusyBox v1.26.2 (2017-06-11 06:38:32 GMT) multi-call binary.
#
# Usage: crond -fbS -l N -d N -L LOGFILE -c DIR
#
#         -f      Foreground
#         -b      Background (default)
#         -S      Log to syslog (default)
#         -l N    Set log level. Most verbose:0, default:8
#         -d N    Set log level, log to stderr
#         -L FILE Log to FILE
#         -c DIR  Cron dir. Default:/var/spool/cron/crontabs
# Setup cron in the foreground, so the container binds to that pid as the
# running process. See crontabs dir (copy above) for schedule. By default
# should run At 00:01 every day. Renew will check if the cert needs
# a renew, and only execute the api if necessary. It will not count against
# the ACME rate limit.
CMD /usr/sbin/crond -fd15
