import Control.Monad(ap,liftM)

--            Input , Output
type World = (String, String)

newtype P a = P (World->(World,a))

runProgram :: P a -> IO ()
runProgram (P f) = 
  interact (\input -> 
    let ((_, output),_) = f (input,"")
    in output)

inChar :: P Char
inChar = P $
  \(i, o) -> ((tail i, o), head i)

inLine :: P String
inLine = P $
  \(i, o) -> 
     ((dropWhile (/='\n') i, o), 
       takeWhile (/='\n') i)

outChar :: Char -> P ()
outChar c = P $
  \(i, o) -> ((i, o ++ [c]), ())

outLine :: String -> P ()
outLine str = P $
  \(i, o) -> ((i, o ++ str ++ "\n"), ())


instance Functor P where
  fmap = liftM
instance Applicative P where
  pure = return
  (<*>) = ap

instance Monad P where
  return x = P $ \(i,o) -> ((i,o), x)
  a >>= b = P $ \(i,o) -> let
    P f1 = a
    ((i1,o1),v1) = f1 (i,o)
    P f2 = b v1
    ((i2,o2),v2) = f2 (i1,o1)
    in ((i2,o2),v2)


greet :: P ()
greet = do
  outLine "May I have your name?"
  name <- inLine
  outLine $ name ++ ", Nice to meet you!"

main = runProgram greet


