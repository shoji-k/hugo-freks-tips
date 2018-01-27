+++
date = "2018-01-26T17:44:52+09:00"
draft = true
title = "ruby"

+++

## syntax

### &.

```
['ruby', 'java'].map {|s| s.upcase }
# ["RUBY", "JAVA"]
['ruby', 'java'].map(&:upcase)
# ["RUBY", "JAVA"]
```

### Symbol

```
:sample.class
# Symbol
```

### Hash

最後の引数がハッシュであればハッシュリテラルの{}を省略できる  

```
def sample(a, hash = {})
  p hash
end
sample 'a', {x: 1, y:2}
sample 'a', x: 1, y:2
```

### save navigation operator

nilだったらnilを返す  

a = nil
#a.upcase # error
a&.upcase

