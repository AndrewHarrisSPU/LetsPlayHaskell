module Main where

import Expect

-- First: How cleanly equality and orderedness are in the langauge
-- ( Eq a ) and ( Ord a ) are super-easy type constraints to bring in
-- Sorting requires these two constraints, so this is cool
equalOp :: ( Eq a ) => a -> a -> Bool
equalOp a b =
  a == b

orderOp :: ( Ord a ) => a -> a -> Bool
orderOp a b =
  a < b

newtype Word = Word String

-- Next: Assigned functions. Straightforward.
sameStr :: String -> String -> Bool
sameStr a b =
  a == b

whosFirst :: String -> String -> String
whosFirst a b
  | a < b = a
  | otherwise = b

-- the better thing would be to use the function 'minimum', but for practice:
whosFirstInList :: [ String ] -> String -> String
whosFirstInList [] min = min
whosFirstInList ( x : xs ) "" = whosFirstInList xs x
whosFirstInList ( x : xs ) min = whosFirstInList xs ( whosFirst x min )

-- really this is about 3 lines, only one interesting line, to do a sort.
whosInOrder :: [ String ] -> [ String ]
whosInOrder [] = []
whosInOrder xs = [ whosFirstInList xs "" ] ++ whosInOrder ( filter ( /= whosFirstInList xs "" ) xs )

main = do
  let sortedHelloWorld = whosInOrder [ "Hello", "World", "What's", "Up", "?" ]
  putStrLn( show sortedHelloWorld )

  putStrLn( expect "Equal op" ( 1 == 1 ) ( equalOp 1 1 ))
  putStrLn( expect "Order op" ( 1 < 2 ) ( orderOp 1 2 ))

  putStrLn( expect "Same" False ( sameStr "Hello" "World" ))
  putStrLn( expect "First" "First" ( whosFirst "First" "Last" ))
  putStrLn( expect "First again" "First" ( whosFirst "Last" "First" ))

  putStrLn( expect "a" "a" ( minimum [ "b", "a" ]))

  let myList = [ "Last", "Middle", "First" ]
  putStrLn( expect "First in list" "First" ( whosFirstInList myList "" ))

  let myList2 = [ "3", "2", "1" ]
  putStrLn( expect "Sorted" [ "1", "2", "3" ] ( whosInOrder myList2 ))