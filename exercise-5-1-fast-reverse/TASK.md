# exercise 5-1. faster reverse

exercise 4. reverse the string で作ったプログラムは、文字列をCharのリストとして扱っているため、実行速度が遅くなっています。文字列処理用のライブラリtext　https://hackage.haskell.org/package/text を利用して、このプログラムをより高速にしてみましょう。

String を利用する版と、Textを利用する版のプログラムを作り、両方のプログラムの実行結果が一致することを確認してください。
また、両方のプログラムについて、ファイルを処理する時間をファイルサイズ等の関数として測定してみてください。
(計測結果、またはそのファイルの所在を、SOLUTION ファイルに記入すること。)

大きな英文テキストファイルは例えば、以下のURLからダウンロードできます。

* http://www.geocities.jp/f9305710/PAI1000000.html (1.2MB)
* http://norvig.com/big.txt (6.2MB)
