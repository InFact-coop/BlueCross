module Components.BlueButton exposing (..)

import Components.StyleHelpers exposing (classes)
import Helpers exposing (removeSpaces, unionTypePayloadToClass, unionTypePayloadToString, unionTypeToString)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)
import Regex exposing (..)


blueButton : TimeScale -> Html Msg
blueButton ts =
    div [ class "w-25-l w-50 tc mb2 flex flex-column inline-flex flex-wrap center" ]
        [ input [ class "dn ", id <| unionTypeToString ts, name "urgency", type_ "radio", value <| unionTypeToString ts ]
            []
        , label
            [ class "health bg-white justify-center items-center inline-flex bg-blue pointer mw4 br1 mr2 h2 br2 white tc pa2 checkedLabel"
            , onClick
                (UpdateUrgency ts)
            , for <| unionTypeToString ts
            ]
            [ text <| Regex.replace All (regex "To") (\_ -> "to") <| unionTypeToString ts ]
        ]


customBlueButton : ( String, String ) -> Html Msg
customBlueButton ( textInput, nameInput ) =
    div [ class "w-25-l w-50 tc mb2 flex flex-column inline-flex flex-wrap center" ]
        [ input [ class "", id textInput, name nameInput, type_ "radio", value textInput ]
            []
        , label [ class "health bg-white justify-center items-center inline-flex bg-blue pointer mw4 br1 mr2 h2 br2 white tc pa2 checkedLabel", for textInput ]
            [ text textInput ]
        ]


newBlueButton : ( a, a -> Msg ) -> String -> Html Msg
newBlueButton ( payload, msg ) content =
    div [ class "w-25-l w-50 tc mb2 flex flex-column inline-flex flex-wrap center" ]
        [ input [ class "dn", id <| removeSpaces content, name <| unionTypePayloadToClass payload msg, type_ "radio", onClick <| msg payload ]
            []
        , label [ classes [ "bg-white items-center inline-flex justify-center bg-blue pointer mw4 br1 mr2 h1 br2 white tc pa3 checkedLabel", unionTypePayloadToClass payload msg ], for <| removeSpaces content ]
            [ text content ]
        ]


preferenceButton : ( a, a -> Msg ) -> String -> String -> Html Msg
preferenceButton ( payload, msg ) content relevantCreature =
    div [ class "w-25-l w-50 tc mb2 flex flex-column inline-flex flex-wrap center" ]
        [ input [ class "dn", id <| removeSpaces <| String.concat [ content, relevantCreature ], name <| unionTypePayloadToClass payload msg, type_ "radio", onClick <| msg payload ]
            []
        , label [ classes [ "bg-white items-center inline-flex justify-center bg-blue pointer mw4 br1 mr2 h1 br2 white tc pa3 checkedLabel", unionTypePayloadToClass payload msg ], for <| removeSpaces <| String.concat [ content, relevantCreature ] ]
            [ text content ]
        ]


controlledBlueButton : ( a, a -> Msg ) -> String -> Bool -> Html Msg
controlledBlueButton ( payload, msg ) content bool =
    div [ class "w-25-l w-50 tc mb2 flex flex-column inline-flex flex-wrap center" ]
        [ input [ class "dn", id <| removeSpaces content, name <| unionTypePayloadToClass payload msg, type_ "radio", onClick <| msg payload, checked bool ]
            []
        , label [ classes [ "bg-white items-center justify-center inline-flex bg-blue pointer mw4 br1 mr2 h1 br2 white tc pa3 checkedLabel", unionTypePayloadToClass payload msg ], for <| removeSpaces content ]
            [ text content ]
        ]
