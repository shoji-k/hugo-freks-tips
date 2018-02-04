+++
date = "2018-01-08T15:17:59+09:00"
draft = false
title = "redux"
categories = [ "engineer" ]
tags = [ "react.js", "redux" ]

+++

# [Core Concepts · Redux](https://redux.js.org/docs/introduction/CoreConcepts.html)

stateの例

```
{
  todos: [{
    text: 'Eat food',
    completed: true
  }, {
    text: 'Exercise',
    completed: false
  }],
  visibilityFilter: 'SHOW_COMPLETED'
}
```

setterがなく、勝手なところで変更されない  
値を変えるためには、actionをdispatchする  

```
{ type: 'ADD_TODO', text: 'Go to swimming pool' }
{ type: 'TOGGLE_TODO', index: 1 }
{ type: 'SET_VISIBILITY_FILTER', filter: 'SHOW_ALL' }
```

typeで何が行われるかわかりやすい  
stateとactionがreducerに渡されて、新しいstateを返す

```
function visibilityFilter(state = 'SHOW_ALL', action) {
  if (action.type === 'SET_VISIBILITY_FILTER') {
    return action.filter
  } else {
    return state
  }
}

function todos(state = [], action) {
  switch (action.type) {
    case 'ADD_TODO':
      return state.concat([{ text: action.text, completed: false }])
    case 'TOGGLE_TODO':
      return state.map(
        (todo, index) =>
          action.index === index
            ? { text: todo.text, completed: !todo.completed }
            : todo
      )
    default:
      return state
  }
}
```

複数のreducerをまとめたreducerでstateをまとめて管理、処理をする  
キーはreducerごとにつける  

```
function todoApp(state = {}, action) {
  return {
    todos: todos(state.todos, action),
    visibilityFilter: visibilityFilter(state.visibilityFilter, action)
  }
}
```

最終的にはstateは１つ、が原則  

# Action Creators

[Redux入門 2日目 Reduxの基本・Actions\(公式ドキュメント和訳\) \- Qiita](https://qiita.com/kiita312/items/8f8d047e5cbd87399ccb)  

reduxはシンプルにactionを返すだけ  
fluxはactionを作ってdispatchもする  

```
function addTodo(text) {
  return {
    type: ADD_TODO,
    text
  }
}
```

# Reducer

[Redux入門 3日目 Reduxの基本・Reducers\(公式ドキュメント和訳\) \- Qiita](https://qiita.com/kiita312/items/7fdce94912d6d9c801f8)  

reducerはstateをactionを受け取って新しいstateを返す  
actionにはUIの内容を入れないのが推奨される  

```
function todoApp(state = initialState, action) {
  switch (action.type) {
    case SET_VISIBILITY_FILTER:
      return Object.assign({}, state, {
        visibilityFilter: action.filter
      })
    default:
      return state
  }
}
```

新しいオブジェクトを作って返さないといけない  

```
Object.assign({}, state, { xxx: xxx })
x Object.assign(state, { xxx: xxx })
```

新しい配列を返す  

```
...state.todos.slice(0, action.index)
```

以下は、  

```
function todoApp(state = {}, action) {
  return {
    visibilityFilter: visibilityFilter(state.visibilityFilter, action),
    todos: todos(state.todos, action)
  }
}
```

以下に変えられる  

```
import { combineReducers } from 'redux'

const todoApp = combineReducers({
  visibilityFilter,
  todos
})

export default todoApp
```

# Store

[Redux入門 4日目 Reduxの基本・Stores\(公式ドキュメント和訳\) \- Qiita](https://qiita.com/kiita312/items/377787c24efac64f2495)  

Reduxではstateは必ず一つ  

役割  

- stateを保持する
- stateへアクセスするためのgetState()を提供する
- stateを更新するためのdispatch(action)を提供する
- リスナーを登録するためのsubscribe(listener)を提供する

Storeを作るには親reducerをcreateStore()へ渡す  

```
import { createStore } from 'redux'
import todoApp from './reducers'
let store = createStore(todoApp)
```

store.subscribe(listener) でリスナーを登録した場合、リスナーではstore.getState()で現在のstateを取得してreducerが呼び出される  

# connect to react.js

[Redux入門 6日目 ReduxとReactの連携\(公式ドキュメント和訳\) \- Qiita](https://qiita.com/kiita312/items/d769c85f446994349b52)

<Provider>でAppを囲んで、storeを渡す  

```
import React from 'react'
import { render } from 'react-dom'
import { createStore } from 'redux'
import { Provider } from 'react-redux'
import App from './containers/App'
import todoApp from './reducers'

let store = createStore(todoApp)

let rootElement = document.getElementById('root')
render(
  <Provider store={store}>
    <App />
  </Provider>,
  rootElement
)
```

# ContainerとComponent

## Presentational Components

componentと呼ばれる？  

Reactでの普通のコンポーネント  
propsを使ってデータのやりとりする  

## Container Components

containerと呼ばれる？  

Redux特有のもので、react-reduxをimport
データは、storeのstateから渡される  
データの変更もactionをdispatchに渡すことで行われる  
connect()を使ってコンポーネントをラップすることで、dispatchやstateが使えるようになる  

ref: [Redux ExampleのTodo Listをはじめからていねいに\(1\) \- Qiita](https://qiita.com/xkumiyu/items/9dfe51d2bcb3bdb06da3)

# connect

connect([mapStateToProps], [mapDispatchToProps])  

引数  
mapDispatchToProps(dispatch, [ownProps])  
mapStateToProps(state, [ownProps])  

