FROM debian:jessie

RUN apt-get update && apt-get install -y curl git make libssl-dev
RUN echo deb http://httpredir.debian.org/debian jessie-backports main | tee /etc/apt/sources.list.d/backports.list
RUN curl http://haproxy.debian.net/bernat.debian.org.gpg | apt-key add -
RUN echo deb http://haproxy.debian.net jessie-backports-1.6 main | tee /etc/apt/sources.list.d/haproxy.list

RUN apt-get update && apt-get install -y -t jessie-backports-1.6 haproxy liblua5.3-dev

RUN git clone https://github.com/brunoos/luasec.git /usr/src/lua-sec
WORKDIR /usr/src/lua-sec
ENV LUAPATH=/usr/share/lua/5.3/
ENV LUACPATH=/usr/lib/lua/5.3/
ENV INC_PATH="-I/usr/include/lua5.3/"
RUN make linux && make install

RUN apt-get purge --auto-remove -y curl git make libssl-dev liblua5.3-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN rm -rf /usr/src/lua-sec

WORKDIR /etc/haproxy
CMD ["haproxy", "-db", "-f", "/etc/haproxy/haproxy.cfg"]
