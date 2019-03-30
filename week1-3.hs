module Main where

-- GHC will look for a module named Expect in local directory
-- expect.hs has it, here
import Expect

-- Fractional is a number-ish type for float, double, complex, etc
areaEllipse :: ( RealFrac a ) => a -> a -> a 
areaEllipse a b
  -- Haskell 2010: comma seperates multiple conditions that result in same execution
  | a <= 0, b <= 0 = 0
  | otherwise = 3.1416 * a * b

main = do
  putStrLn ( expect "unit ellipse" 3.1416 ( areaEllipse 1 1 ))
  putStrLn ( expect "not unit ellipse" 3.1416 ( areaEllipse 10 10 ))