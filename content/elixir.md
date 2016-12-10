+++
title = "elixir"
draft = false
date = "2016-12-10T16:17:30+09:00"
categories = [ "engineer" ]
tags = [ "elixir" ]

+++


hello world  

```
IO.puts "hello world"
```

FizzBuzz  
pattern 1  

```
Enum.each(1..15, fn(i) ->
  cond do
    rem(i, 3) == 0 && rem(i, 5) == 0 ->
      IO.puts("FizzBuzz")
    rem(i, 3) == 0 ->
      IO.puts("Fizz")
    rem(i, 5) == 0 ->
      IO.puts("Buzz")
    true ->
      IO.puts(i)
  end
end)
```

pattern 2  

```
defmodule FizzBuzz do
  def judge(n) do
    f = fizz(n)
    b = buzz(n)
    if f == "" and b == "" do
      n
    else
      "#{f}#{b}"
    end
  end

  def fizz(n) do
    if rem(n,3) == 0 do
      "Fizz"
    else
      ""
    end
  end
  def buzz(n) do
    if rem(n,5) == 0 do
      "Buzz"
    else
      ""
    end
  end
  def puts(n) do
    IO.puts(judge(n));
  end
end

Enum.map(1..15, &FizzBuzz.puts/1)
```

Hanoi Tower

```
defmodule Hanoi do
  def hanoi(n, a, b, c) do
    if n > 0 do
      hanoi n - 1, a, c, b
      IO.puts "#{n}番目の円盤を#{a}から#{b}へ移動"
      hanoi n - 1, c, b, a
    end
  end
end

Hanoi.hanoi 5, "A", "B", "C"
```

