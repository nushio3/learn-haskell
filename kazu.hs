data Count = One | Two | Three | Huh
           deriving (Eq, Ord, Show, Read, Enum)

instance Num Count where
  One + One = Two
  One + Two = Three
  Two + One = Three
  _   + _   = Huh

  Three - One = Two
  Three - Two = One
  Two   - One = One
  _     - _   = Huh

  One * x   = x
  x   * One = x
  _   * _   = Huh

  negate _ = Huh

  abs x = x

  signum Huh = Huh
  signum _   = One

  fromInteger 1 = One
  fromInteger 2 = Two
  fromInteger 3 = Three
  fromInteger _ = Huh

main :: IO ()
main = do
  print $ One + One
  print $ One + Two
  print $ One + Three
  print $ One + 4
  print $ [One ..]
