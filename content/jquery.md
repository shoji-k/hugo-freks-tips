+++
title = "jquery"
draft = false
date = "2016-12-07T14:05:06+09:00"
categories = [ "engineer" ]
tags = [ "jquery" ]

+++

kata  

```
$(function() {
  //
});
```

ajax kata  

```
var data = {type: type};
$.ajax({
  type: 'POST',
  cache: false,
  data: data,
  url: 'sample',
  dataType: 'json',
  success: function(res){
    // console.log(res);
  },
  error: function(res){
    alert('エラーが発生しました');
  }
});
```
