HAProxy 1.6 with lua-sec
========================
[![By Camptocamp](https://img.shields.io/badge/by-camptocamp-fb7047.svg)](http://www.camptocamp.com)

This image runs on Debian Jessie, and provides HAProxy from http://haproxy.debian.net/
with lua5.3 support and [lua-sec](https://github.com/brunoos/luasec).

Usage
-----

You might run the container as follow:
```Bash
$ docker run -v /opt/haproxy.cfg:/etc/haproxy/haproxy.cfg -d camptocamp/haproxy-luasec
```

HAProxy configuration notes
---------------------------
Please ensure you don't have "daemon" option in haproxy configuration file, and that the "stats socket" actually exists.

If "daemon" is set in your configuration, the default CMD should start it in foreground, but it would be better to simply
remove this directive.

If the stats socket is set to some non-existing location, HAProxy will refuse to start. Debian default configuration file will not
allow HAProxy to start due to this setting pointing to /run/haproxy, which doesn't exist.
