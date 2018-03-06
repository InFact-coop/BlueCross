module Components.ContactButtons exposing (..)

import Helpers exposing (onCheckboxInput)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


contactButton : String -> Html Msg
contactButton buttonText =
    div [ class "fl w-33 w-25-ns tc mb2" ]
        [ input [ class "dn", id buttonText, name "personality", type_ "checkbox", value buttonText, onCheckboxInput ToggleContactMethods ]
            []
        , label [ class "personality bg-white flex items-center justify-center bg-blue  pointer mw4 br1 mr2 h1 br2 white tc pa3", for buttonText ]
            [ text buttonText ]
        ]
