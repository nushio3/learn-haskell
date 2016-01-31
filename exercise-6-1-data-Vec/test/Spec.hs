import Control.Applicative
import Test.Framework (defaultMain, testGroup)
import Test.Framework.Providers.API (Test)
import Test.Framework.Providers.QuickCheck2 (testProperty)
import Test.QuickCheck.Arbitrary

import Data.Vec

instance Arbitrary a => Arbitrary (Vec a) where
  arbitrary = Vec <$> arbitrary <*> arbitrary <*> arbitrary

tests :: [Test]
tests = [
  testProperty "addition of Vec is associative." $
  \u v w ->  u+(v+w) == (u+v)+ (w :: Vec Integer) ,
  testProperty "addition of Vec is commutative." $
  \u v ->  u+v == v + (u :: Vec Integer),
  testProperty "zero." $
  \v ->  v +0  == (v :: Vec Integer),
  testProperty "one." $
  \v ->  1*v  == (v :: Vec Integer),
  testProperty "negate." $
  \v ->  v - v == (0 :: Vec Integer),
  testProperty "distributive vector." $
  \a u v ->  fromInteger a*(u+v)  ==fromInteger  a*u +fromInteger  a * (v :: Vec Integer),
  testProperty "distributive scalar." $
  \a b v ->  fromInteger (a+b)*v  == fromInteger a*v+fromInteger b* (v :: Vec Integer),
  testProperty "commutative scalar product." $
  \a b v ->  fromInteger (a*b)*v  == fromInteger a* (fromInteger b* (v :: Vec Integer)),
  testProperty "inner product is zero for perpendicular vector." $
  \x y -> Vec x 0 0 ・ Vec 0 y 0 == (0::Integer),
  testProperty "outer product is zero for parallel vector." $
  \x1 x2 -> Vec x1 0 0 × Vec x2 0 0 == (0::Vec Integer)
        ]

main :: IO ()
main = defaultMain tests
