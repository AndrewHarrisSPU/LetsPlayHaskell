module Main where

-- Scalars can't be negative
import Scalar

-- RealFloat rather than Num as a constraint might be more specific
-- But requires (I think) more support for methods on a Scalar than I punched in

-- TODO: How to make a rectangle function that only accepts Scalars
-- but *outside* of Scalar module, like:
-- rectangle :: Scalar -> Scalar -> Scalar
-- But because I'm hiding the ability to construct Scalars directly here,
-- that fails. Trickier to work around than I am with Haskell atm ... so, TODO, I hope.

-- rectangle ::( Num a ) => a -> a -> a
-- rectangle a b = a * b

main = do
  putStrLn "Enter width and height: "

  -- input
  wIn <- readLn :: IO Double
  hIn <- readLn :: IO Double

  -- validation via "correct by construction"
  let
    w = constructScalar wIn
    h = constructScalar hIn

  -- of course a line like:
  -- let z = Scalar 10
  -- won't work - we aren't exporting that from the Scalar module

  putStrLn ( show ( rectangleScalar w h ))