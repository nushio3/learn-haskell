{-# LANGUAGE TypeSynonymInstances #-}

import System.IO.Unsafe

type Prog a =
  Int -> (Int, a)

runProg :: Prog a -> (Int, a)
runProg p = p 0

pureProgram x = 
  (\n -> (n, x))

exec :: Prog a -> (a -> Prog b) -> Prog b
exec p1 p2 = 
  (\n -> let (n1,a1) = p1    n
             (n2,b1) = p2 a1 n1 in 
         (n2,b1))

get :: Prog String
get = 
  \n -> (n+1, unsafePerformIO getLine)

put :: String -> Prog ()
put str = 
  \n -> (n+1, unsafePerformIO $ putStrLn str)


main = print $ runProg $ 
  put "May I have your name?" `exec`
  (\() -> get `exec` 
  (\name -> put $ "Hello, " ++ name))
