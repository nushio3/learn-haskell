module Main where

import Data.Vec

main :: IO ()
main = do
  print $ Vec 1 2 3 + Vec 10 10 10
  -- Vec 11 12 13 と表示されてほしい！

  print $ Vec 1 2 3 ・ Vec 10 10 10
  -- Vec 60 と表示されてほしい！

  print $ Vec 1 2 3 × Vec 10 10 10
  -- Vec (-10) 20 (-10) と表示されてほしい！
