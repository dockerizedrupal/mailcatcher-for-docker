FROM dockerizedrupal/base-debian-jessie:latest

MAINTAINER Jürgen Viljaste <j.viljaste@gmail.com>

ENV TERM xterm

ADD ./src /src

RUN /src/entrypoint.sh build

EXPOSE 80
EXPOSE 443
EXPOSE 25

ENTRYPOINT ["/src/entrypoint.sh", "run"]
