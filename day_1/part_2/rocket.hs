import System.IO

main :: IO ()
main = do  
        contents <- readFile "input.txt"
        print . foldl (\acc x -> acc + fuelCalc x) 0 . map (read::String->Int) . words $ contents

-- Fuel calculation for component mass + the fuel required to transport it
fuelCalc :: Integral a => a -> a
fuelCalc payload 
    | payload <= 0 = 0
    | otherwise    = fuel + fuelCalc fuel
    where fuel = max 0 ( ( payload `div` 3) - 2 )
    