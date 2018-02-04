+++
date = "2018-02-04T10:44:59+09:00"
draft = false
title = "promise"
categories = [ "engineer" ]
tags = [ "javascript" ]

+++

非同期処理をいい感じに使えるAPIパターン  

reference  

- [Promise \- JavaScript \| MDN](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Global_Objects/Promise)
- [JavaScript Promiseの本](http://azu.github.io/promises-book/)
- [Using promises \- JavaScript \| MDN](https://developer.mozilla.org/ja/docs/Web/JavaScript/Guide/Using_promises)

```
let promise = new Promise(function(resolve, reject){
  let err = something();
  if (err) {
    reject(err); // errorのときはrejectを呼ぶ
    return;
  }
  resolve(data); // 正常なときはresolveを呼ぶ
});

// thenに正常なときの動作を書く
// catchにエラーのときの動作を書く
promise
  .then((data) => {
    console.log('success');
  }
  .catch((err) => {
    console.log('error');
  });
```

メソッドチェーン  
Promiseをつなぐことで非同期処理をつなげられる  

```
promise
  .then((data) => {
    console.log('success');
    return new Promise((resolve, reject) => {
      resolve();
    });
  }
  .then(() => {
    // ...
  })
  .catch((err) => {
    console.log('error');
  });
```
