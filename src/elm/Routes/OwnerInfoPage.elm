module Routes.OwnerInfoPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


ownerInfoPage : Model -> Html Msg
ownerInfoPage model =
    div [ class "w-60-ns center" ]
        [ h1 [ class "tc f1" ] [ text "hello" ]
        , p [ class "f3 w60 mh1 tc" ] [ text "Owner Info" ]
        ]