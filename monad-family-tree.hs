type Hito = String

parents :: Hito -> [Hito]
parents x = [x++"の父", x++"の母"]

senzo :: Int -> Hito -> [Hito]
senzo 0 x = return x
senzo n x = do
  y <- senzo (n-1) x
  parents y

senzo' n x = 
  senzo (n-1) x >>=
  parents 


main = mapM_ putStrLn $ 
  senzo 3 "村主"
