module Main where
import Control.Monad
import Data.List
import System.Environment (getArgs)
import System.IO
import System.Posix.Unistd
import System.Process (system)
import System.Random


draw :: [String] -> IO ()
draw names0 = do
  let names = names0 ++ names0
  let getSortedNames = do
        rs <- replicateM (length names) randomIO
        return $ map snd $ sort $ zip (rs::[Int]) names
  sn0 <- getSortedNames
  forM sn0 $ \n0 -> do
    system "clear"
    spinNames <- take 50 <$> concat <$> replicateM 10 getSortedNames
    forM spinNames $ \n1 -> do
      putStr $ n1 ++ "\r"
      hFlush stdout
      usleep 10000
    system "clear"
    putStrLn $ n0 ++ " 様"

    getLine
  return ()

main :: IO ()
main = do
  argv <- getArgs
  contents <- mapM readFile argv
  let names = lines $ concat contents
  forever $ draw names
