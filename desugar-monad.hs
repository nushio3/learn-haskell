main :: IO ()
main = getLine >>= (\x -> getLine >>= (\y -> let z = x++y in putStrLn z))

