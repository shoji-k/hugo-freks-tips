+++
date = "2017-09-29T13:03:01+09:00"
draft = false
title = "react.js"
categories = [ "engineer" ]
tags = [ "react.js" ]

+++

# tutorial

[reactjs tutorial](https://reactjs.org/tutorial/tutorial.html)

# tips

## copy array

```
const squares = this.state.squares.slice();
```

## copy object

```
var newPlayer = Object.assign({}, player, {score: 2});
```

## Functional Components

propを受けてrenderするだけのClassはFunctionに変えられる

```
class Square extends React.Component {
  render() {
    return (
      <button className="square" onClick={() => this.props.onClick()}>
        {this.props.value}
      </button>
    );
  }
}
```

が

```
function Square(props) {
  return (
    <button className="square" onClick={props.onClick}>
      {props.value}
    </button>
  );
}
```

となる

# creating a new app

react.js version: v.16.0.0  

see: [Installation \- React](https://facebook.github.io/react/docs/installation.html#creating-a-new-application)

```
$ npm init
$ npm install --save create-react-app
$ ./node_modules/.bin/create-react-app myapp
$ cd myapp
$ yarn start
```

## docker

```
$ docker run --name reactjs -it -v $(pwd):/app -p 13000:3000 node /bin/bash
$ npm install -g create-react-app
$ create-react-app myapp
$ cd myapp
$ yarn start
```

then access localhost:13000  





