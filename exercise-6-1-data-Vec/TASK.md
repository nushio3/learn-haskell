# exercise 6-1. 3次元ベクトルを表す型を作ろう

app/Main.hs では3次元ベクトルを表す型 Vec が使える前提でプログラムを書いています。
この型は Data/Vec.hs にて

```
data Vec a = Vec a a a
```

として定義されかかっていますが、実装はまだ途中です。

1. src/Data/Vec.hs を編集して、 app/Main.hs が動くようにしてください！
2. test/Spec.hs にはこのライブラリをテストするプログラムが入っています。
   `stack test` を実行して、あたなが実装したモジュール Data.Vec がテストを通ることを確認してください。
