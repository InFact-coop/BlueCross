module Components.LovesHates exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


loveHate : Model -> Html Msg
loveHate model =
    div
        [ class "flex justify-between mb5 w-75 center" ]
        [ div [ class "gray fw1 " ] [ text "No thanks!" ]
        , div [ class "gray fw1  " ] [ text "Loves!" ]
        ]
