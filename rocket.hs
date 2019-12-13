import System.IO

main :: IO ()
main = do  
        contents <- readFile "input.txt"
        print . foldl (\acc x -> acc + fuelCalc x) 0 . map (read::String->Int) . words $ contents

fuelCalc :: Integral a => a -> a
fuelCalc = subtract 2 . (`div` 3)