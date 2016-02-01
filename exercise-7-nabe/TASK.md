# exercise 7. 鍋サーバー

次のような手順で、鍋サーバープログラムを完成させて下さい。Data.Mapを操作するのに必要な関数は、すべて以下のマニュアルのどこかにあるはずです。

https://hackage.haskell.org/package/containers-0.5.7.1/docs/Data-Map-Lazy.html

1. "recipe.txt" から具材の名前と数を読み取り、 [(String, Int)] 型の値を作ります。
2. guzaiがnabeに入っていたらその具材の個数を１減らす、guzaiの個数がゼロになったらその項目をMapから消す、
   ように、関数eatを追記してください。
3. 鍋が空になったかどうかを判定する式を書いてください。
