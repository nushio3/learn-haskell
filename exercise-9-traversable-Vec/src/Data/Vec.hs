module Data.Vec where

import Data.Monoid
import Data.Foldable
import Data.Traversable

data Vec a = Vec a a a deriving (Show)

instance Num a => Num (Vec a) where
  -- . . . . . .

(・) :: Vec a -> Vec a -> a
(Vec ax ay az) ・ (Vec bx by bz) = undefined

(×) :: Vec a -> Vec a -> Vec a
(Vec ax ay az) × (Vec bx by bz) = undefined

instance Functor Vec where
  fmap f (Vec x y z) = undefined

instance Applicative Vec where
  pure a = undefined
  (Vec ax ay az) <*> (Vec bx by bz) = undefined

instance Foldable Vec where
  foldMap toMonoid (Vec x y z) = undefined

instance Traversable Vec where
  sequenceA (Vec fx fy fz) = undefined
