-- Comments with --
{- or this way -}

module Main where -- OK, this looks manageable ...
import Control.Monad -- Going to import control flow more interesting than the Church / lambda calculus basics

main = do 
  putStrLn "An integer, please: " -- Hey Haskell looks easy here
  n <- readLn :: IO Int -- IO Int (not Int, not IO Integer!) is a type specifier

-- The $ thing is ... a function, and punctuation-named function defaults to infix syntax.
-- So it looks like an operator but logically just a little different
-- a $ b is equivalent to ($) a b ...

  putStrLn $ show ( n ) -- "show" is sort of a .toString() - a serialization in string form. The $ ... not sure

  replicateM n $ putStrLn "Hello, World!" -- replicateM ... replicates the action n times

-- Moderate brain melt on control flow as a library.
-- Subtle but foreboding brain melt on a infix b versus (infix) a b
-- Severe brain melt when looking at replicateM. Lots to learn here, on what and why.