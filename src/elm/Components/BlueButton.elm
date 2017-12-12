module Components.BlueButton exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


blueButton : String -> Html Msg
blueButton contents =
    div [ class "" ]
        [ input [ class "dn", id contents, name "urgency", type_ "radio", value contents ]
            []
        , label [ class "health bg-white flex items-center justify-center bg-blue  pointer mw4 br1 mr2 h1 br2 white tc pa3", onClick MakeNextClickable, for contents ]
            [ text contents ]
        ]
