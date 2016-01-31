module Main where

import Text.Trifecta

question :: Parser ()
question = do
  many $ satisfy $ (/= "?")
  string "?"
  eof


main = do
  str <- getLine
  case parseString question (Columns 0 0) str of
    Failure xs -> do
      displayLn xs
      putStrLn "質問ではない。"
    Success _  -> putStrLn "質問ありがとう。"
  main
