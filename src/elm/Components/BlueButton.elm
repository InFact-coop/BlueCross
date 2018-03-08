module Components.BlueButton exposing (..)

import Components.StyleHelpers exposing (classes)
import Helpers exposing (removeSpaces, unionTypePayloadToClass, unionTypePayloadToString, unionTypeToString)
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
            [ class "health bg-white justify-center items-center inline-flex bg-blue pointer mw4 br1 mr2 h2 br2 white tc pa2"
            , onClick
                (UpdateUrgency ts)
            , for <| unionTypeToString ts
            ]
            [ text <| unionTypeToString ts ]
        ]


customBlueButton : ( String, String ) -> Html Msg
customBlueButton ( textInput, nameInput ) =
    div [ class "w-25-l w-50 tc mb2 flex flex-column inline-flex flex-wrap center" ]
        [ input [ class "", id textInput, name nameInput, type_ "radio", value textInput ]
            []
        , label [ class "health bg-white justify-center items-center inline-flex bg-blue pointer mw4 br1 mr2 h2 br2 white tc pa2", for textInput ]
            [ text textInput ]
        ]


newBlueButton : ( a, a -> Msg ) -> String -> Html Msg
newBlueButton ( payload, msg ) content =
    div [ class "w-25-l w-50 tc mb2 flex flex-column inline-flex flex-wrap center" ]
        [ input [ class "", id <| removeSpaces content, name <| unionTypePayloadToClass payload msg, type_ "radio", onClick <| msg payload ]
            []
        , label [ classes [ "bg-white items-center justify-center bg-blue pointer mw4 br1 mr2 h1 br2 white tc pa3", unionTypePayloadToClass payload msg ], for <| removeSpaces content ]
            [ text content ]
        ]
