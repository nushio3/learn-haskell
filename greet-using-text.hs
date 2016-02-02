import Data.Text    (pack)
import Data.Monoid  ((<>))
import Data.Text.IO (getLine, putStrLn)
import Prelude hiding (getLine, putStrLn)

main :: IO ()
main = do
  name <- getLine
  putStrLn $ pack "Hello, " <> name


