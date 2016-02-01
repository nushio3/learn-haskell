module Main where

import Control.Monad (replicateM)
import Text.Trifecta
import Text.Trifecta.Delta(Delta(..))
import Text.PrettyPrint.ANSI.Leijen(putDoc)


int :: Parser Int
int = fromInteger <$> integer

n_words :: Int -> Parser [String]
n_words n = replicateM n 
  (token $ some alphaNum)

grammar :: Parser ()
grammar = int >>= n_words >> eof


main = do
  putStr "INPUT> "
  str <- getLine
  case parseString grammar (Columns 0 0) str of
    Failure doc -> do
      putDoc doc
      putStrLn "Wrong!"
    Success xs -> putStrLn "Correct!"
  main
