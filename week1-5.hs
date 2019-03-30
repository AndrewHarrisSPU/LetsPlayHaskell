module Main where

import Data.List

import Expect

factorial :: ( Integral a ) => a -> a

-- basic factorial:
-- the way I came up with (not sure foldl' over foldl needed?)
-- factorial a = foldl' (*) 1 [ 1..a ]

-- a way that is google-able and amusingly fast
-- factorial a = product [ 1..a ]

-- Adds a limit of one-million in the accumulator
-- This short-circuits the recursive evaluation, which we definitely want
-- There are better ideas than using -1 to signal this result, but, will save that for later
productLimited :: ( Integral a ) => [ a ] -> a -> a
productLimited [] accumulated = accumulated
productLimited ( x : xs ) accumulated
  | x * accumulated > 1000000 = -1
  | otherwise = productLimited xs $! ( x * accumulated )

factorial a = productLimited [ 1..a ] 1

report :: ( Integral a, Show a ) => a -> String
report i
  | i <= 0 = "SMALL INPUT"
  | i > 1000000 = "BIG INPUT"
  | otherwise =
    let r = factorial i
    in  if r == -1 then "BIG OUTPUT"
        else ( show r )

main = do
  putStrLn "An Integer, please: "
  -- using IO Integer rather than IO Int
  -- IO Integer is arbitrary precision!
  n <- readLn :: IO Integer

  -- seems to overflow negative at n = 20 for Int type
  putStrLn $ report n

-- General observation: Not sure about guards, if/else as pertains to style
-- The report function here, for example, is dense and mixed in a way that seems tricky