module Components.PersonalityButtons exposing (..)

import Components.StyleHelpers exposing (classes)
import Helpers exposing (ifThenElse, onCheckboxInput)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


personalityButton : String -> Bool -> Html Msg
personalityButton buttonText shouldOverflow =
    div [ classes [ "tc mb2 w-33 w-25-ns", ifThenElse shouldOverflow "center ma0-ns fl-ns" "fl" ] ]
        [ input [ class "dn", id buttonText, name "personality", type_ "checkbox", value buttonText, onCheckboxInput TogglePersonality ]
            []
        , label [ class "personality bg-white flex items-center justify-center bg-blue  pointer mw4 br1 mr2 h1 br2 white tc pa3 checkedLabel", for buttonText ]
            [ text buttonText ]
        ]
