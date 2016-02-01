data Person = Male String Int
            | Female String Int
            | Cat String Int Person

class Greetable a where
  greet :: a -> IO ()

instance Greetable Person where
  greet (Male name _) = putStrLn $ "Hello, Mr. " ++ name
  greet (Female name _) = putStrLn $ "Hello, Ms. " ++ name
  greet (Cat name _ _) = putStrLn $ "Meow, " ++ name

main :: IO ()
main = do
  greet $ Male "nushio" 32
