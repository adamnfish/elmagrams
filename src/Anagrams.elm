module Anagrams exposing (..)

import Set exposing (Set)
import Set.Extra



stringToSet : String -> Set Char
stringToSet str =
    Set.fromList <| String.toList str


anagrams : String -> List String -> List String
anagrams input availableWords =
    let
        availableChars = stringToSet input

        possibleWords = List.filter (\word -> Set.Extra.subset (stringToSet word) availableChars) availableWords
    in
        possibleWords
