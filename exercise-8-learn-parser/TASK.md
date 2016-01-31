# exercise 8. 四則演算パーザー

trifectaはパーザーコンビネータライブラリ(パーザーを作るための道具を提供するライブラリ)です。
src/ フォルダに、trifectaを使ういくつかのサンプルが入っています。

* src/parse-integer.hs

標準入力を1行毎に読み取り、整数を + 記号で区切った式であった場合にはその和を表示し、
それ以外の式の場合にはエラーメッセージを表示するプログラムです。

* src/parse-question.hs

標準入力から文字列を受け取り、一行ごとに、疑問文であると判定した場合は "質問ではない。"
疑問文であった場合は "質問ありがとう。"と表示するプログラムです。

* src/parse-S-expression.hs

ファイル名をコマンドライン引数から受け取り、各ファイルをS式(lispのプログラムに使われている形式)としてパーズし、
構文木を表示するプログラムです。


## 四則演算プログラム

以上を参考にしながら、parse-arithmetic.hs を完成させて下さい。

1. 四則演算を含む構文木Expr のパーザ、 arithmeticExprを完成させてください。

buildExpressionParser https://hackage.haskell.org/package/parsers/docs/Text-Parser-Expression.html#v:buildExpressionParser を解読して使うのもよし。自分で文法を考えてみるのもよいでしょう。

2. 構文木Exprを評価して数値に変える関数evalを完成させてください。

3. 以上の数式パーザー＆評価機によって　input-arith-(n).txt　が正しく計算できるか確認してください。
