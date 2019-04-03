module Main where

import Expect

-- Oh, this one is easy mode.
startsWith :: String -> String -> Bool
startsWith [] [] = True -- same length
startsWith [] b = False -- b longer than a
startsWith a [] = True -- a longer than b
startsWith ( x : xs ) ( y : ys )
  | x /= y = False
  | otherwise = startsWith xs ys

main = do
  putStrLn( expect "nothing" True ( startsWith "" "" )) 
  putStrLn( expect "Seattle" True ( startsWith "Seattle" "Sea" )) 
  putStrLn( expect "Sea" False ( startsWith "Sea" "Seattle" ))
  putStrLn( expect "New York" False ( startsWith "New York" "Old" ))