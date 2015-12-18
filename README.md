HAProxy 1.6 with lua-sec
========================
[![By Camptocamp](https://img.shields.io/badge/by-camptocamp-fb7047.svg)](http://www.camptocamp.com)

This image runs on Debian Jessie, and provides HAProxy from http://haproxy.debian.net/
with lua5.3 support and [lua-sec](https://github.com/brunoos/luasec).

Usage
-----

You might run the container as follow:
```Bash
$ docker run -v /opt/haproxy.cfg:haproxy.cfg -d camptocamp/haproxy-luasec
```

Please ensure you don't have "daemon" option in haproxy configuration file, and that the "stats socket" actually exists.
