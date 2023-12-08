import System.IO
import Data.Char (isDigit)
import Data.List (find)

findFirstDigit :: String -> Maybe Char
findFirstDigit = find isDigit

findLastDigit :: String -> Maybe Char
findLastDigit = find isDigit . reverse

convertToDigitPair :: String -> String
convertToDigitPair line = case (findFirstDigit line, findLastDigit line) of
                               (Just first, Just last) -> [first] ++ [last]
                               _ -> ""

main = do
    content <- readFile "./input.txt"
    let fileLines = lines content
    let concatenatedDigits = map convertToDigitPair fileLines
    let validIntegers = map read (filter (/="") concatenatedDigits)
    let totalSum = sum validIntegers
    print totalSum
