import Data.Foldable
import Data.Traversable
import Data.SBV
import Data.Vec

instance EqSymbolic a => EqSymbolic (Vec a) where
  u .== v = toList u .== toList v

problem :: Symbolic SBool
problem = do
  a <- exists "a"
  let o :: Vec SReal
      o = Vec (-1) 0 0
      v :: Vec SReal
      v = Vec 2 1 1
      z = o + pure a * v
  return $ z ・ z .== 1

problem2 :: Symbolic SBool
problem2 = do
  oy <- exists "oy"
  let o :: Vec SReal
      o = Vec 0 oy 0
  v <- traverse exists (Vec "x" "y" "z")
  constrain $ v ・ v .== 1
  a <- exists "a"
  b <- exists "b"

  return $ (o + pure a * v .== Vec (-1) 0 0 &&& o + pure b * v .== Vec 1 2 0)


main :: IO ()
main = do
  putStrLn "Problem 1:"
  ret <- allSat $ problem
  print ret
  putStrLn "Problem 2:"
  ret <- allSat $ problem2
  print ret
