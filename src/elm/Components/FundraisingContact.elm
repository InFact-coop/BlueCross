module Components.FundraisingContact exposing (..)

import Helpers exposing (onCheckboxInput)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


fundraisingButton : ( String, String ) -> Html Msg
fundraisingButton ( buttonText, forText ) =
    div []
        [ input [ class "mr1", id forText, name "fundraising", type_ "checkbox", value forText, onCheckboxInput ToggleFundraisingContact ]
            []
        , label [ class "", for forText ]
            [ text buttonText ]
        ]
