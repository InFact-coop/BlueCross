module Components.DogBreedDropDown exposing (..)

import Data.DogBreeds exposing (..)
import Helpers exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


dogBreedDropDown : DogBreeds -> Html Msg
dogBreedDropDown dogBreed =
    option [ value <| unionTypeToString dogBreed ]
        [ text <| unionTypeToString dogBreed ]
