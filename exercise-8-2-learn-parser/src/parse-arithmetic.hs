module Main where

import Text.Trifecta
import Text.Trifecta.Delta(Delta(..))
import Text.PrettyPrint.ANSI.Leijen(putDoc)

data Expr = Literal Integer
          | Add Expr Expr
          | Sub Expr Expr
          | Mul Expr Expr
          | Div Expr Expr

arithmeticExpr :: Parser Expr
arithmeticExpr = do
  n  <- integer
  x2 <- optional $ do
    symbol "+"
    arithmeticExpr
  case x2 of
    Nothing -> return $ Literal n
    Just x -> return $ Add (Literal n) x

eval :: Expr -> Integer
eval (Literal n) = n
eval (Add x y) = eval x + eval y


main = do
  str <- getLine
  case parseString question (Columns 0 0) str of
    Failure doc -> do
      putDoc doc
      putStrLn "Parse error."
    Success expr  -> print $ eval expr
  main
