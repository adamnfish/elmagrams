module AnagramTests exposing (..)

import Test exposing (..)
import Expect

import Anagrams exposing (anagrams)


anagramsTests : Test
anagramsTests =
    describe "anagrams"
        [ test "should find exact match" <|
            \_ ->
                Expect.equal
                    (anagrams "abc" ["abc"])
                    ["abc"]
        , test "should find word among others" <|
            \_ ->
                Expect.equal
                    (anagrams "abc" ["abc", "def"])
                    ["abc"]
        , test "should find subset word" <|
            \_ ->
                Expect.equal
                    (anagrams "abcdef" ["abc"])
                    ["abc"]
        , test "should find subset words among others" <|
            \_ ->
                Expect.equal
                    (anagrams "abcdef" ["abc", "def", "ghi"])
                    ["abc", "def"]
        ]
