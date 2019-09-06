module Main exposing (..)

import Anagrams exposing (anagrams)
import Browser
import Html exposing (Html, text, div, ul, li, p, h1, img, input, button)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (class)

import Words exposing (words)
import PubWords exposing (pubwords)


---- MODEL ----

allWords : List String
allWords =
    words ++ pubwords


type alias Model =
    { input : String
    , results : List String
    }


init : ( Model, Cmd Msg )
init =
    ( { input = ""
      , results = []
      }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = NoOp
    | UpdateInput String
    | CalculateAnagrams


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateInput input ->
            ( { model | input = input }, Cmd.none )
        CalculateAnagrams ->
            let
                results = anagrams model.input allWords
            in
            ( { model | results = results }, Cmd.none )
        NoOp ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ p [] [ text "Input letters" ]
                    , input
                        [ onInput UpdateInput ]
                        [ text "Your Elm App is working!" ]
                    , button
                        [ onClick CalculateAnagrams ]
                        [ text "Calculate" ]
            ]
        , ul [ class "results--list" ]
            (List.map displayResult model.results)
        ]

displayResult : String -> Html Msg
displayResult result =
    li [] [ text result ]


---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
