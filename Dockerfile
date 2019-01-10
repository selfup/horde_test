FROM alpine:latest

WORKDIR /opt

ADD main /opt/bin/main

CMD ["/opt/bin/main"]
