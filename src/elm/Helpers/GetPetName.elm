module Helpers.GetPetName exposing (..)

import Types exposing (..)


getPetName : Model -> String
getPetName model =
    if model.petName == "" then
        "your dog"
    else
        model.petName
