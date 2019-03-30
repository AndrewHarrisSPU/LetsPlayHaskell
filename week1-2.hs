module Main where

-- expect is type specified using :: and -> operators
-- so, it's a function. But!

-- One more very interesting part of the type signature:
-- ( Eq a, Show a ) =>

-- Here, Eq a and Show a are interfaces that a type 'a'
-- that expect is called on needs to fulfill

expect :: ( Eq a, Show a ) => String -> a -> a -> String
expect s a b
  | a == b = ""
  | a /= b =
    s ++ ":" ++
    "\n\tWanted: " ++ show a ++
    "\n\tGot: " ++ show b ++ "\n"

diff :: ( Num a ) => a -> a -> a
diff a b = a - b

main = do
  putStrLn ( expect "first case" 0 1  )

  -- how to use infix and partial application ...
  -- backticks and lazy evaluation
  putStrLn (( "next case" `expect` 1 ) 2 )
  putStrLn (( "next case again" `expect` ) 1 2 )

  let x = 3
  putStrLn ( expect "want one " 1 x )
  putStrLn ( expect "want x" x 1 )

-- Diff, with literals read as ints and floats
  putStrLn ( expect "1 minus 1" 0 ( diff 2 1 ))
  putStrLn ( expect "1 minus 1" 0 ( diff 2.0 1.0 ))
  putStrLn ( expect "floating point comparison" 0 ( diff 1.0 1.0 ))

-- Relative to the C++ way of doing this:
-- Constraints in type specifiers is pretty mindblowing.
-- Lazy evaluation doesn't seem necessary for constraints, and it's
-- a pretty interesting bit of type theory going on here IMHO
-- Also the code reads a lot simpler than generic < TemplateType > stuff, IMO