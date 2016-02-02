# Stackの使い方

## インタプリタ編

`stack ghci`で、プロジェクトの`stack.yaml`に従った環境、または
stackのグローバル設定ファイル`~/.stack/global-project/stack.yaml`に従った環境でインタプリタが起動する。

### インタプリタのプロンプトを簡潔にする

デフォルトの設定では、インタプリタのプロンプトにはロードされているモジュールの一覧が表示される。モジュールが多すぎると見にくくなることも。
この設定は、`:set prompt`で変更できる。

```
~$ stack ghci
Run from outside a project, using implicit global project config
Using resolver: lts-5.0 from implicit global project's config file: /home/nushio/.stack/global-project/stack.yaml
Error parsing targets: The specified targets matched no packages.
Perhaps you need to run 'stack init'?
Warning: build failed, but optimistically launching GHCi anyway
Configuring GHCi with the following packages:
GHCi, version 7.10.3: http://www.haskell.org/ghc/  :? for help
Ok, modules loaded: none.
Prelude>
Prelude> import Data.Map
Prelude Data.Map> import Data.List
Prelude Data.Map Data.List> import Data.Array.Storable.Internals
Prelude Data.Map Data.List Data.Array.Storable.Internals> print $ 1+1
2
Prelude Data.Map Data.List Data.Array.Storable.Internals> :set prompt "> "
> print $ 1+1
2
>
```

ホームフォルダの`.ghci`ファイルにghciへの入力を書いておくと、ghciを起動するたびにこれを実行してくれる。
```
$ cat ~/.ghci
:set -W -fno-warn-unused-imports
:seti -XDataKinds -XPolyKinds -XTypeFamilies -XScopedTypeVariables -XGADTs -XTypeOperators -XTemplateHaskell
:def x (\t -> return (":kind! " ++ t))
:set prompt "> "
let myName = "Takayuki Muranushi"
putStrLn "今日もHappy Hacking!"
```

## ビルド編

### `hello-project`という名前の新しいプロジェクトを作る
````
$ stack new hello-project simple
````

### プロジェクトのビルド
プロジェクトのフォルダに移動して`stack build`
````
$ cd hello-project
$ stack build
hello-project-0.1.0.0: configure
Configuring hello-project-0.1.0.0...
hello-project-0.1.0.0: build
Preprocessing executable 'hello-project' for hello-project-0.1.0.0...
[1 of 1] Compiling Main             ( src/Main.hs, .stack-work/dist/x86_64-linux/Cabal-1.22.5.0/build/hello-project/hello-project-tmp/Main.o )
Linking .stack-work/dist/x86_64-linux/Cabal-1.22.5.0/build/hello-project/hello-project ...
hello-project-0.1.0.0: copy/register
Installing executable(s) in
/home/nushio/nushiolab/practice/learn-haskell/exercise-1-hello-cat/hello-project/.stack-work/install/x86_64-linux/lts-5.0/7.10.3/bin
````
実行ファイルは、stackが生成するバージョン固有のフォルダ(`.stack-work/install/x86_64-linux/lts-5.0/7.10.3/bin`など)に生成されます。どこに生成したかはstackが言ってくれます (`Installing executable(s) in...`)

### ビルドされたファイルの実行

`stack exec`で、stackが所在を把握している実行ファイルを実行してくれます。

````
$ stack exec hello-project
hello world
````

### お手軽開発支援

次のようにすると、ファイルの変更を監視して繰り返しビルドしてくれる。
````
$ stack build --file-watch
````
別コンソールで`stack build --file-watch`を立ち上げておくとデバッグがはかどります。



### stackが生成するファイルの構造

````
$ tree hello-project/
hello-project/
├── LICENSE
├── Setup.hs
├── hello-project.cabal
├── src
│   └── Main.hs
└── stack.yaml

1 directory, 5 files
````
###　プロジェクトで利用するライブラリの追加

```
$ cat hello-project.cabal
name:                hello-project
version:             0.1.0.0
synopsis:            Simple project template from stack
description:         Please see README.md
homepage:            http://github.com/nushio3/hello-project#readme
license:             BSD3
license-file:        LICENSE
author:              Takayuki Muranushi
maintainer:          muranushi@gmail.com
copyright:           2010 Author Here
category:            Web
build-type:          Simple
cabal-version:       >=1.10

executable hello-project　　　　　　-- 生成される実行ファイルの名前
  hs-source-dirs:      src          -- 実行ファイルの所在
  main-is:             Main.hs      -- ソースコードの名前
  default-language:    Haskell2010
  build-depends:       base >= 4.7 && < 5
                     , quickcheck   -- 使いたいライブラリはここに追記します
                     , text         -- textを使いたい場合
                     , vector
```


### テンプレートの一覧を表示する
````
$ stack templates
chrisdone
franklinchen
ghcjs
ghcjs-old-base
hakyll-template
hspec
new-template               # 最小限のライブラリ・実行ファイル・テストが揃っているテンプレート
quickcheck-test-framework
rubik
scotty-hello-world
scotty-hspec-wai
servant
simple                     # 最もシンプルな、ソースが１つのテンプレート
yesod-hello-world
yesod-minimal
yesod-mongo
yesod-mysql
yesod-postgres
yesod-postgres-fay
yesod-simple
yesod-sqlite
````

### ネットに繋がらない！けどプロジェクトを作りたい。

ローカルに既にダウンロードされているテンプレートのファイル名を指定することができます。

```
stack new offline-project ~/.stack/templates/simple.hsfiles
```
