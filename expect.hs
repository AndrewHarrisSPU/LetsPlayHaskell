module Expect where

expect :: ( Eq a, Show a ) => String -> a -> a -> String
expect s a b
  | a == b = ""
  | a /= b =
    s ++ ":" ++
    "\n\tWanted: " ++ show a ++
    "\n\tGot: " ++ show b ++ "\n"