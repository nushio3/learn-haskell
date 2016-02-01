module Main where

-- {- Hint -}
--
instance Num String where
  a + b = a ++ b
--   ...

main :: IO ()
main = do
  putStrLn "May I have your name?"
  name <- getLine
  putStrLn $ "Congratulations, " + name + " has now mastered class Num!"

--  {- Can you also make these work? -}
--  putStrLn 5963
--  putStrLn $ 3 * ("All hail " + name + "! ")
