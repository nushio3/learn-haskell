module Main where

import Data.Vec

main :: IO ()
main = do
  let u, v :: Vec Integer
      v = Vec 1 2 3
      u = Vec 10 10 10
  print $ u + v
  -- Vec 11 12 13 と表示されてほしい！

  print $ u ・ v
  -- 60 と表示されてほしい！

  print $ u × v
  -- Vec (-10) 20 (-10) と表示されてほしい！
