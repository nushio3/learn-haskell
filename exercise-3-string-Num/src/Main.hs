module Main where

main :: IO ()
main = do
  putStrLn "May I have your name?"
  name <- getLine
  putStrLn $ "Congratulations, " + name + " has now mastered class Num!"
