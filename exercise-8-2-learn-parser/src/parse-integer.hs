module Main where

import Text.Trifecta
import Text.Trifecta.Delta(Delta(..))
import Text.PrettyPrint.ANSI.Leijen(putDoc)


additions :: Parser [Integer]
additions = do
  xs <- integer `sepBy` symbol "+"
  eof
  return xs


main = do
  str <- getLine
  case parseString additions (Columns 0 0) str of
    Failure doc -> do
      putDoc doc
      putStrLn "I can't understand this expression!"
    Success xs -> print $ sum xs
  main
