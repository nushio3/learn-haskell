main :: IO ()
main =
  getLine >>= (\x ->
  getLine >>= (\y ->
  let z = x ++ y in
  putStrLn z))

main2 :: IO ()
main2 = do
  x <- getLine
  y <- getLine
  let z = x ++ y
  putStrLn z
