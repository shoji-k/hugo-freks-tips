+++
title = "syslog"
draft = false
date = "2017-04-26T18:44:47+09:00"
categories = [ "engineer" ]
tags = [ "syslog" ]

+++

# Ubuntu

## rsyslog

rsyslogが使われている  
facilityとpriorityを指定するとログを吐く場所を変えられる  

facility: mail  
priority: alert  

```
$ logger -p mail.alert xxxxx
```

### config

$ vi /etc/rsyslog.d/50-default.conf  

```
mail.info     /var/log/mail.info
mail.warn     /var/log/mail.warn
mail.err      /var/log/mail.err
```

