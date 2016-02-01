{-# LANGUAGE DeriveTraversable, DeriveFoldable, DeriveFunctor #-}

import Control.Monad
import Data.Traversable
import Test.QuickCheck

data Pair a = P a a
              deriving (Eq, Show, Functor, Foldable, Traversable)

instance Applicative Pair where
  pure = return
  (P f g) <*> (P x y) = P (f x) (g y)
instance Monad Pair where
  return x = P x x
  (P x y) >>= k = do
    (P x2 _) <- k x
    (P _ y2) <- k y
    return $ P x2 y2


newtype Bad a = B {unB :: (Maybe (Pair a))}

-- http://stackoverflow.com/questions/13034229/concrete-example-showing-that-monads-are-not-closed-under-composition-with-proo?lq=1
join2 :: (Monad m, Monad n, Traversable n) => m (n (m (n a))) -> m (n a)
join2 = fmap join  . join .  fmap sequence

instance Monad Bad where
  return x = B $ Just (P x x)
  (B x) >>= k = B $ join2 $ (fmap $ fmap $ unB . k) x

-- monad laws
-- (1) join (return x) = x
-- (2) join (fmap return x) = x
-- (3) join (join x) = join (fmap join x)

main :: IO ()
main = print $ P 4 2
