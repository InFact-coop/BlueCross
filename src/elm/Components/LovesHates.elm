module Components.LovesHates exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


loveHate : Model -> Html Msg
loveHate model =
    div
        [ class "flex justify-around mb5" ]
        [ div [ class "gray fw1 mr5" ] [ text "No thanks!" ]
        , div [ class "gray fw1 ml5 " ] [ text "Loves!" ]
        ]
