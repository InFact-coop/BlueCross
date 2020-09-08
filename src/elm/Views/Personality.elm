module Views.Personality exposing (..)

import Components.PersonalityButtons exposing (..)
import Components.StyleHelpers exposing (classes)
import Components.TextBox exposing (..)
import Helpers exposing (getPetName, ifThenElse, pronounConverter)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


dogPersonalityButtons =
    [ personalityButton "Friendly" False
    , personalityButton "Playful" False
    , personalityButton "Cuddly" False
    , personalityButton "Nervous" False
    , personalityButton "Laid-Back" False
    , personalityButton "Energetic" False
    , personalityButton "Calm" False
    , personalityButton "Excitable" False
    , personalityButton "Sociable" False
    , personalityButton "Boisterous" False
    ]


catPersonalityButtons =
    [ personalityButton "Lap-Cat" False
    , personalityButton "Playful" False
    , personalityButton "Cuddly" False
    , personalityButton "Nervous" False
    , personalityButton "Laid-Back" False
    , personalityButton "Loving" False
    , personalityButton "Energetic" False
    , personalityButton "Skittish" True
    ]


personality : Model -> Html Msg
personality model =
    div [ class "w-60-ns w-90 center ma3 ma0-ns mw8" ]
        [ div [ class "blue b mb4 mt4 f4 lh-copy" ]
            [ text <|
                "What words best describe "
                    ++ getPetName model
                    ++ "?  This will help us find a home to suit "
                    ++ pronounConverter "their" model.gender
                    ++ " personality."
            ]
        , div [ class "overflow-auto" ] <|
            ifThenElse
                (model.petType == Cat)
                catPersonalityButtons
                dogPersonalityButtons
        , div
            [ class "pt4 pb3 dib blue b" ]
            [ text <| "Please tell us a bit more about " ++ getPetName model ++ "'s personality so that we can find the best home for " ++ pronounConverter "them" model.gender ]
        , newTextBox ( "Please tell us here", "personality" ) UpdateOtherPersonality
        , div
            [ class "mt4 tc w-100" ]
            [ a [ classes [ "link w-25-l w-50-m w-100 br2 white pa3 br2 f4 dib", ifThenElse (model.nextClickable == True) "bg-navy" "bg-gray disableButton o-30" ], href "#new-home" ] [ text "Next" ]
            ]
        ]
