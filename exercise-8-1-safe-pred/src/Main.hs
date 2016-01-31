module Main where

import Control.Spoon (spoon)
import Control.DeepSeq (NFData)

predMay :: (Enum a, NFData a) => a -> Maybe a
predMay = spoon . pred

pred3 ::  (Enum a, NFData a) => a -> Maybe a
pred3 = undefined

predN ::  (Enum a, NFData a) => Int -> a -> Maybe a
predN 0 x = Just x

main :: IO ()
main = do
  putStrLn "hello world"
  print $ pred3 True
  print $ predN 256 'a'
  print $ predN 32 'z'
