# Dockerfile for tor client - Alpine Linux
[![](https://badge.imagelayers.io/bwits/tor:latest.svg)](https://imagelayers.io/?images=bwits/tor:latest 'Get your own badge on imagelayers.io')

### To run

```
$ docker run -d --name tor -p 9150:9150 bwits/tor
```

### To use, configure your browser/client to use a SOCKS server

    $ docker-machine ip default
    192.168.99.100
    
    server IP: 192.168.99.100
    Server port: 9150

