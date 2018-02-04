+++
date = "2018-02-04T11:08:24+09:00"
draft = false
title = "async await"
categories = [ "engineer" ]
tags = [ "javascript" ]

+++

# async  

非同期処理を定義する関数宣言  

```
async function sample() {}
```

async functionとは  

- 呼び出されるとPromiseを返す
- 値をreturnした場合、Promiseは戻り値をresolveする
- 例外や何らかの値をthrowした場合はその値をrejectする

```
async function promise(){
  let err = something();
  if (err) {
    throw new Error(err);
  }
  return data;
});

// thenに正常なときの動作を書く
// catchにエラーのときの動作を書く
promise()
  .then(data => {
    console.log('success');
  }
  .catch(err => {
    console.log('error');
  });
```

# await

awaitを指定した関数のPromiseの結果が返されるまで、async function内の処理を一時停止する  
awaitはasync function内でないと利用できない  

reference  

- [async function \- JavaScript \| MDN](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Statements/async_function)

example on the above mdn page  

```
// 普通のpromise
function resolveAfter2Seconds(x) {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve(x);
    }, 2000);
  });
}

// 同期で動く
async function add1(x) {
  const a = await resolveAfter2Seconds(20);
  const b = await resolveAfter2Seconds(30); // a が返ってくるまで動作しない
  return x + a + b;
}

add1(10).then(v => {
  console.log(v);  // 4秒後に60を表示します。
});


async function add2(x) {
  const p_a = resolveAfter2Seconds(20); // 非同期で動く
  const p_b = resolveAfter2Seconds(30); // 非同期で動く
  return x + await p_a + await p_b; // 値が返ってくるのは待つ
}

add2(10).then(v => {
  console.log(v);  // 2秒後に60を表示します。
});[
```

