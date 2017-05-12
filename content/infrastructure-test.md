+++
title = "infrastructure test"
draft = false
date = "2017-02-05T16:25:08+09:00"
categories = [ "engineer" ]
tags = [ "infrastructure", "test" ]

+++

#### Apache ab

$ ab -n 10 -c 10 http://sample.com/

10ユーザーで10リクエストを送る（1ユーザー1） 
- -n リクエスト数
- -c ユーザー数

result

```
Server Software:        nginx
Server Hostname:        sample.com
Server Port:            80

Document Path:          /
Document Length:        28320 bytes

Concurrency Level:      10
Time taken for tests:   6.355 seconds
Complete requests:      10
Failed requests:        0
Total transferred:      286420 bytes
HTML transferred:       283200 bytes
Requests per second:    1.57 [#/sec] (mean)
Time per request:       6354.745 [ms] (mean)
Time per request:       635.475 [ms] (mean, across all concurrent requests)
Transfer rate:          44.02 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        1    1   0.3      1       2
Processing:  3825 4641 683.5   4545    6352
Waiting:     3496 4502 753.9   4470    6296
Total:       3826 4642 683.6   4546    6354

Percentage of the requests served within a certain time (ms)
  50%   4546
  66%   4664
  75%   4755
  80%   4787
  90%   6354
  95%   6354
  98%   6354
  99%   6354
 100%   6354 (longest request)
```

set nginx server cache  
result 2  

```
Server Software:        nginx
Server Hostname:        sample.com
Server Port:            80

Document Path:          /
Document Length:        28320 bytes

Concurrency Level:      10
Time taken for tests:   4.865 seconds
Complete requests:      10
Failed requests:        0
Total transferred:      286420 bytes
HTML transferred:       283200 bytes
Requests per second:    2.06 [#/sec] (mean)
Time per request:       4865.296 [ms] (mean)
Time per request:       486.530 [ms] (mean, across all concurrent requests)
Transfer rate:          57.49 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        2    2   0.3      2       3
Processing:  3832 4414 426.1   4516    4863
Waiting:     3644 4304 475.6   4483    4824
Total:       3834 4416 426.2   4519    4865

Percentage of the requests served within a certain time (ms)
  50%   4519
  66%   4796
  75%   4826
  80%   4848
  90%   4865
  95%   4865
  98%   4865
  99%   4865
 100%   4865 (longest request)
```
