module Routes.PetInfoPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


petInfoPage : Model -> Html Msg
petInfoPage model =
    div [ class "w-60-ns center" ]
        [ h1 [ class "tc f1" ] [ text "hello" ]
        , p [ class "f3 w60 mh1 tc" ] [ text "Pet Info" ]
        ]
