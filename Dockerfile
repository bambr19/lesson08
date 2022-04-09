FROM alpine:3.15
LABEL lesson=7
COPY justwait.sh /
ENTRYPOINT ["/bin/sh", "/justwait.sh"]
