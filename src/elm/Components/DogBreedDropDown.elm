module Components.DogBreedDropDown exposing (..)

import Helpers exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


dogBreedDropDown : DogBreed -> Html Msg
dogBreedDropDown dogBreed =
    option [ value <| unionTypeToString dogBreed ]
        [ text <| unionTypeToString dogBreed ]


reasonDropdown : String -> Html Msg
reasonDropdown string =
    option [ value string ] [ text string ]
