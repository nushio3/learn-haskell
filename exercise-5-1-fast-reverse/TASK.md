# exercise 5. faster reverse

exercise 4. reverse the string で作ったプログラムは、文字列をCharのリストとして扱っているため、実行速度が遅くなっています。文字列処理用のライブラリtext　https://hackage.haskell.org/package/text を利用して、このプログラムをより高速にしてみましょう。

String を利用する版と、Textを利用する版のプログラムを作り、両方のプログラムの実行結果が一致することを確認してください。
また、例えば、以下のURLにあるような大きめのファイルを処理する時間を、両方のプログラムについて測定してみてください。

* http://www.geocities.jp/f9305710/PAI1000000.html (1.2MB)
* http://norvig.com/big.txt (6.2MB)
