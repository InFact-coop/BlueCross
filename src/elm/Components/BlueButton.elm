module Components.BlueButton exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


blueButton : String -> Html Msg
blueButton contents =
    button [ class "bg-blue button white b pa2" ] [ text contents ]
