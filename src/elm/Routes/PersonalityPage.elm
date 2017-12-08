module Routes.PersonalityPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


personalityPage : Model -> Html Msg
personalityPage model =
    div [ class "ma3" ]
        [ div [ class "blue b mb4 mt4" ] [ text "To help us find the right home for your dog, which words best describe him?" ]
        , div []
            [ div [ class "fl w-third tc mb2" ]
                [ input [ class "dn", id "playful", name "personality", type_ "checkbox", value "playful" ]
                    []
                , label [ class "personality bg-white flex items-center justify-center bg-blue  pointer mw4 br1 mr2 h1 br2 white tc pa3", for "playful" ]
                    [ text "Playful" ]
                ]
            , div [ class "fl w-third tc mb2" ]
                [ input [ class "dn", id "nervous", name "personality", type_ "checkbox", value "nervous" ]
                    []
                , label [ class "personality bg-blue flex items-center justify-center bg-white  pointer mw4 br1 mr2 h1 br2 white tc pa3", for "nervous" ]
                    [ text "Nervous" ]
                ]
            , div [ class "fl w-third tc mb2" ]
                [ input [ class "dn", id "cuddly", name "personality", type_ "checkbox", value "cuddly" ]
                    []
                , label [ class "personality bg-blue flex items-center justify-center bg-white  pointer mw4 br1 mr2 h1 br2 white tc pa3", for "cuddly" ]
                    [ text "Cuddly" ]
                ]
            ]
        , div []
            [ div [ class "fl w-third tc mb2" ]
                [ input [ class "dn", id "laid-back", name "personality", type_ "checkbox", value "laid-back" ]
                    []
                , label [ class "personality bg-white flex items-center justify-center bg-blue  pointer mw4 br1 mr2 h1 br2 white tc pa3", for "laid-back" ]
                    [ text "Laid Back" ]
                ]
            , div [ class "fl w-third tc mb2" ]
                [ input [ class "dn", id "obedient", name "personality", type_ "checkbox", value "obedient" ]
                    []
                , label [ class "personality bg-blue flex items-center justify-center bg-white  pointer mw4 br1 mr2 h1 br2 white tc pa3", for "obedient" ]
                    [ text "Obedient" ]
                ]
            , div [ class "fl w-third tc mb2" ]
                [ input [ class "dn", id "barker", name "personality", type_ "checkbox", value "barker" ]
                    []
                , label [ class "personality bg-blue flex items-center justify-center bg-white  pointer mw4 br1 mr2 h1 br2 white tc pa3", for "barker" ]
                    [ text "Barker" ]
                ]
            ]
        , div []
            [ div [ class "fl w-third tc mb2" ]
                [ input [ class "dn", id "loving", name "personality", type_ "checkbox", value "loving" ]
                    []
                , label [ class "personality bg-white flex items-center justify-center bg-blue  pointer mw4 br1 mr2 h1 br2 white tc pa3", for "loving" ]
                    [ text "Loving" ]
                ]
            , div [ class "fl w-third tc mb2" ]
                [ input [ class "dn", id "energetic", name "personality", type_ "checkbox", value "energetic" ]
                    []
                , label [ class "personality bg-blue flex items-center justify-center bg-white  pointer mw4 br1 mr2 h1 br2 white tc pa3", for "energetic" ]
                    [ text "Energetic" ]
                ]
            , div [ class "fl w-third tc mb2" ]
                [ input [ class "dn", id "grumpy", name "personality", type_ "checkbox", value "grumpy" ]
                    []
                , label [ class "personality bg-blue flex items-center justify-center bg-white  pointer mw4 br1 mr2 h1 br2 white tc pa3", for "grumpy" ]
                    [ text "Grumpy" ]
                ]
            ]
        , div []
            [ div [ class "w-third tc mb4 m0-auto" ]
                [ input [ class "dn", id "greedy", name "personality", type_ "checkbox", value "greedy" ]
                    []
                , label [ class "personality bg-white flex items-center justify-center bg-blue  pointer mw4 br1 mr2 h1 br2 white tc pa3", for "greedy" ]
                    [ text "Greedy" ]
                ]
            ]
        , div [ class "mt4 tc w-100" ]
            [ a [ class "w-100 bg-navy br2 white pa3 br2 f4 dib", href "#location" ] [ text "Next" ]
            ]
        ]
