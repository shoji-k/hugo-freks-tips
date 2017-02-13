+++
title = "kibana"
draft = true
date = "2017-02-13T23:46:14+09:00"

+++

# use docker

```
$ docker pull kibana
$ docker run --name kibana --link elast:elasticsearch -p 5601:5601 -d kibana
```
