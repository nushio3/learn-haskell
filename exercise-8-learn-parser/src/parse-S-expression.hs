import Control.Applicative((<|>))
import Data.Char (isSpace)
import Text.Trifecta
import System.Environment (getArgs)

data SExpr = Atom String | List [SExpr] deriving Show

program :: Parser [SExpr]
program = sexpr `sepEndBy` spaces

sexpr :: Parser SExpr
sexpr =  list <|> atom

atom :: Parser SExpr
atom = Atom <$> some identifierChar <* spaces

identifierChar :: Parser Char
identifierChar = satisfy $ \c -> not (isSpace c) && c /= '(' && c /= ')'

list :: Parser SExpr
list = do
  symbol "("
  ret <- many sexpr
  symbol ")"
  return $ List ret

processFile :: FilePath -> IO ()
processFile filename = do
  result <- parseFromFile program filename
  case result of
    Nothing -> putStrLn "parse error."
    Just x -> mapM_ print x

main :: IO ()
main = do
  filenames <- getArgs
  mapM_ processFile filenames
