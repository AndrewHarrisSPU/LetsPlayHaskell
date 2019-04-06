module Main where

-- Pattern matching is cool!
bananer :: [ Char ] -> [ Char ] -> [ Char ]
bananer [] output = output
bananer ( 'b' : 'a' : 'n' : 'a' : 'n' : 'a' : xs ) output = bananer xs ( output ++ "panana" )
bananer ( x : xs ) output = bananer xs ( output ++ [ x ])

main = do
  putStrLn ( bananer, "a banana jumped over another banana and I got banana'ed", [] )