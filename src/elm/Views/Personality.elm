module Views.Personality exposing (..)

import Components.PersonalityButtons exposing (..)
import Components.StyleHelpers exposing (classes)
import Components.TextBox exposing (..)
import Helpers exposing (getPetName, ifThenElse)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


personality : Model -> Html Msg
personality model =
    div [ class "w-60-ns w-90 center ma3 ma0-ns mw8" ]
        [ div [ class "blue b mb4 mt4 f4 lh-copy" ] [ text <| "What words would you use to describe  " ++ getPetName model ++ ". This will help us to find " ++ getPetName model ++ " a great new home" ]
        , div []
            [ personalityButton "Noisy"
            , personalityButton "Sleepy"
            , personalityButton "Friendly"
            , personalityButton "Shy"
            , personalityButton "Playful"
            , personalityButton "Cuddly"
            , personalityButton "Nervous"
            , personalityButton "Laid-Back"
            , personalityButton "Obedient"
            , personalityButton "Loving"
            , personalityButton "Energetic"
            , personalityButton "Grumpy"
            , personalityButton "Hungry"
            , personalityButton "Calm"
            , personalityButton "Exciteable"
            , div [ class "fl w-33 w-25-ns tc mb2 dn dib-ns" ]
                [ input [ class "dn", id "growler", name "personality", type_ "checkbox", value "growler" ]
                    []
                , label [ class "personality bg-white flex items-center justify-center bg-blue  pointer mw4 br1 mr2 h1 br2 white tc pa3", for "growler" ]
                    [ text "Growler" ]
                ]
            ]
        , div
            [ class "pt4 pb3 dib blue b" ]
            [ text <| "Are there any other personality traits you would like to tell " ++ getPetName model ++ "'s new owner about?" ]
        , newTextBox ( "Please tell us here", "personality" ) UpdateOtherPersonality
        , div
            [ class "mt4 tc w-100" ]
            [ a [ classes [ "link w-25-l w-50-m w-100 br2 white pa3 br2 f4 dib", ifThenElse (model.nextClickable == True) "bg-navy" "bg-gray disableButton o-30" ], href "#new-home" ] [ text "Next" ]
            ]
        ]
