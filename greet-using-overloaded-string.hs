{-# LANGUAGE OverloadedStrings #-}
import Data.Monoid  ((<>))
import qualified Data.Text    as T
import qualified Data.Text.IO as T

main :: IO ()
main = do
  name <- T.getLine
  T.putStrLn $ "Hello, " <> name
  putStrLn "This is String"


