import Test.QuickCheck

bothBig :: Integer -> Integer -> Bool
bothBig x y = x>=2 && y>=2

main :: IO ()
main = do
  quickCheck (\x y -> bothBig x y ==> x*y /= 7)
  quickCheck (\x y -> bothBig x y ==> x*y /= 8)
