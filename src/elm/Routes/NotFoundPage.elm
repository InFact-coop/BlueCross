module Routes.NotFoundPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Helpers.GetPetName exposing (..)


notFoundPage : Model -> Html Msg
notFoundPage model =
    div [ class "w-60-ns center" ]
        [ p [ class "f3 w60 mh1 tc" ] [ text "404 : Not Found" ]
        , a [ class "f4 w-60 mh1 tc db center link blue", href "/" ] [ text <| "Please click here so we can help you find " ++ getPetName model ++ " a new home" ]
        ]
