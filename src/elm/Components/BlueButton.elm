module Components.BlueButton exposing (..)

import Helpers exposing (unionTypeToString)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


blueButton : TimeScale -> Html Msg
blueButton ts =
    div [ class "w-25-l w-50 tc mb2 flex flex-column inline-flex flex-wrap center" ]
        [ input [ class "dn ", id <| unionTypeToString ts, name "urgency", type_ "radio", value <| unionTypeToString ts ]
            []
        , label
            [ class "health bg-white items-center justify-center bg-blue pointer mw4 br1 mr2 h1 br2 white tc pa3"
            , onClick
                (UpdateUrgency ts)
            , for <| unionTypeToString ts
            ]
            [ text <| unionTypeToString ts ]
        ]


customBlueButton : ( String, String ) -> Html Msg
customBlueButton ( textInput, nameInput ) =
    div [ class "w-25-l w-50 tc mb2 flex flex-column inline-flex flex-wrap center" ]
        [ input [ class "dn", id textInput, name nameInput, type_ "radio", value textInput ]
            []
        , label [ class "health bg-white items-center justify-center bg-blue pointer mw4 br1 mr2 h1 br2 white tc pa3", for textInput ]
            [ text textInput ]
        ]


newBlueButton : ( a, a -> Msg ) -> String -> Html Msg
newBlueButton ( payload, msg ) content =
    div [ class "w-25-l w-50 tc mb2 flex flex-column inline-flex flex-wrap center" ]
        [ input [ class "dn", id content, name <| unionTypeToString msg, type_ "radio", value content, onClick <| msg payload ]
            []
        , label [ class "health bg-white items-center justify-center bg-blue pointer mw4 br1 mr2 h1 br2 white tc pa3", for content ]
            [ text content ]
        ]
