module Main where

-- Recursive version of this, for kicks - needs an extra [] parameter when called
-- I think this is not at all efficient
-- wd :: [ char ] -> [char] -> [ char ] -- source, accumulating, result lists
-- wd ( x : xs ) [] = wd xs [ x ]
-- wd ( x : xs ) ( a : ab ) = wd xs [ a, x ]
-- wd [] ab = ab

-- So easy.
wd :: [ char ] -> [ char ]
wd list = [ head list, last list ]

main = do
  putStrLn ( wd "alphabet" )
  putStrLn ( wd "seattle" )
  putStrLn ( wd "newyork" )
