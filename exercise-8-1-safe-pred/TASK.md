# Exercise 8-1. safe pred

pred :: Enum a => a -> aは危険な部分関数です。
```
> pred True
False
> pred False
*** Exception: Prelude.Enum.Bool.pred: bad argument
>
```

安全なpred関数 `predMay :: Enum a => a -> Maybe a`
を用意しましたので、これを使って、ある値の「３つ前の値」、「ｎ個前の値」を求める関数を作ってください。
`pred3 :: Enum a => a -> Maybe a`
`predN :: Enum a => Int -> a -> Maybe a`
