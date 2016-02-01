module Main where

import qualified Data.Map as M

-- guzaiがnabeに入っていたらその具材の個数を１減らす、
-- guzaiの個数がゼロになったらその項目をMapから消す、
-- ように、関数eatを追記してください。
eat :: String ->  M.Map String Int -> M.Map String Int
eat guzai nabe = nabe

party ::   M.Map String Int -> IO ()
party nabe = do
  putStrLn $ "Nabe: " ++ show nabe
  order <- getLine
  let newNabe = eat order nabe
  if False -- ここで、鍋が空(null)かどうかを判定してください。
    then putStrLn "The party is over!"
    else party newNabe

readRecipe :: IO (M.Map String Int)
readRecipe = do
  content <- readFile "recipe.txt"
  -- content の内容を解釈して、おいしそうな鍋の中身を作ってください！
  return $ M.fromList [("Kuuki",1)]

main :: IO ()
main = do
  initialNabe <- readRecipe
  party initialNabe
