module Main where

import Text.Trifecta
import Text.Trifecta.Delta(Delta(..))
import Text.PrettyPrint.ANSI.Leijen(putDoc)


question :: Parser ()
question = do
  many $ satisfy $ (/= '?')
  string "?"
  eof


main = do
  str <- getLine
  case parseString question (Columns 0 0) str of
    Failure doc -> do
      putDoc doc
      putStrLn "質問ではない。"
    Success _  -> putStrLn "質問ありがとう。"
  main
