module Components.TextBox exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


textBox : ( String, String ) -> Html Msg
textBox ( holdingText, nameFor ) =
    div [ class "w-100" ]
        [ textarea [ class "w-100 h5 bn bg-light-blue br2 pa2 overflow-auto", id "traits", name nameFor, placeholder holdingText, attribute "rows" "6", attribute "cols" "4", attribute "maxlength" "200" ]
            []
        ]


newTextBox : ( String, String ) -> (String -> Msg) -> Html Msg
newTextBox ( holdingText, nameFor ) msg =
    div [ class "w-100" ]
        [ textarea [ class "w-100 h5 bn bg-light-blue br2 pa2 overflow-auto", id "traits", name nameFor, placeholder holdingText, attribute "rows" "6", attribute "cols" "4", attribute "maxlength" "200", onInput msg ]
            []
        ]
