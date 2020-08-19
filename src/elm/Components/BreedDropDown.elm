module Components.BreedDropDown exposing (..)

import Helpers exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


dogBreedDropDown : DogBreed -> Html Msg
dogBreedDropDown dogBreed =
    option [ value <| unionTypeToString dogBreed ]
        [ text <| unionTypeToString dogBreed ]


catBreedDropDown : CatBreed -> Html Msg
catBreedDropDown catBreed =
    option [ value <| unionTypeToString catBreed ]
        [ text <| unionTypeToString catBreed ]


reasonDropdown : String -> Html Msg
reasonDropdown string =
    option [ value string ] [ text string ]
