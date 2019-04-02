-- trying for "correct by construction" here
-- i.e. use Scalars, be assured they can't possibly be negative

module Scalar
  ( constructScalar -- exporting only the constructor is the goal
  , rectangleScalar
  ) where

-- Types! In Haskell, this is quite interesting
-- (thinking, wow, I have a lot to learn ...)

-- the {} is 'record notation', value :: type sort of syntax
-- Not sure this is idiomatic for newtype
newtype Scalar =
  Scalar { value :: Double 
         }

-- 'instance' is a way of extending the definition of a type
-- it's not specifying an instance of a type, it's an instance of a typeclass
-- where typeclass is perhaps an additional layer of abstraction of 'type'
-- here it is used to supply something like a method for Scalar

-- these definitions are very terse
-- why it works? not completely sure but newtypes only get exactly one field (I think?)
instance Show Scalar where
  show ( Scalar v ) = show v

instance Num Scalar where
  ( Scalar a ) * ( Scalar b ) = ( Scalar ( a * b ))

-- a method to procure a scalar
constructScalar :: Double -> Scalar
constructScalar n =
  Scalar ( abs n )

rectangleScalar :: Scalar -> Scalar -> Scalar
rectangleScalar a b = a * b