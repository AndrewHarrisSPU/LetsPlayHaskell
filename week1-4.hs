module Main where

import Data.List

import Expect

-- sigma is easy
-- sigma evaluating more strictly for performance is trickier ...

-- foldl' from Data.List is a strict accumulator sort of idea
sigma :: ( Num a ) => [ a ] -> a
sigma = foldl' (+) 0

-- foldl is lazy, so we'll have an enormous stack ...
sigmaSlow :: ( Num a ) => [ a ] -> a
sigmaSlow = foldl (+) 0

-- this is the logic behind foldl', more explicitly
-- we have an accumulator value
-- also we use $! to force strictness at a key point
-- (this last point seems worth staring at for a bit)
sigmaOther :: ( Num a ) => [ a ] -> a -> a
sigmaOther [] accumulated = accumulated
sigmaOther ( x:xs ) accumulated = sigmaOther xs $! ( x + accumulated )

main = do
  putStrLn "An integer, please: "
  n <- readLn :: IO Int

  -- [ 1..n ] is a "list comprehension"
  -- Spicy.
  putStrLn $ show ( sigma [ 1..n ] ) -- fast
  putStrLn $ show ( sigmaSlow [ 1..n ] ) -- slow
  putStrLn $ show ( sigmaOther [ 1..n ] 0 ) -- fast
  putStrLn $ show ( sum [ 1..n ]) -- surprisinlgy, slow!