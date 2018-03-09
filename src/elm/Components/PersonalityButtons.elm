module Components.PersonalityButtons exposing (..)

import Helpers exposing (onCheckboxInput)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


personalityButton : String -> Html Msg
personalityButton buttonText =
    div [ class "fl w-33 w-25-ns tc mb2" ]
        [ input [ class "dn", id buttonText, name "personality", type_ "checkbox", value buttonText, onCheckboxInput TogglePersonality ]
            []
        , label [ class "personality bg-white flex items-center justify-center bg-blue  pointer mw4 br1 mr2 h1 br2 white tc pa3 checkedLabel", for buttonText ]
            [ text buttonText ]
        ]
