module Routes.PetInfoPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Html.Events exposing (on, targetValue)
import Json.Decode as Json
import Helpers.GetPetName exposing (..)


onBlurValue : (String -> msg) -> Attribute msg
onBlurValue tagger =
    on "blur" (Json.map tagger targetValue)


petInfoPage : Model -> Html Msg
petInfoPage model =
    div [ class "ma3" ]
        [ div [ class " blue b mb2" ] [ text "What is your pets name?" ]
        , div []
            [ input [ type_ "text", class "bg-light-blue w-80 br2 pa3 gray bn", onBlurValue UpdatePetName ]
                [ text "" ]
            ]
        , div [ class "gray f6 fw1" ] [ text "Please enter your pets name" ]
        , div [ class " blue b mb2 mt4" ] [ text "What pet do you have?" ]
        , div [ class "m0-auto tc" ]
            [ img [ src "./assets/circle-images.svg" ] []
            ]
        , div []
            [ div [ class "blue b mb2 mt4" ] [ text <| "What Breed is " ++ getPetName model ++ "?" ]
            , div []
                [ select [ class "bg-light-blue bn w-80 gray tc pa3 mb3 f5 fw1" ]
                    [ option [ value "Please choose" ]
                        [ text "Please Choose" ]
                    , option [ value "Labrador" ]
                        [ text "Labrador" ]
                    ]
                ]
            ]
        , div []
            [ div [ class "gray f6 fw1" ] [ text "Other:" ]
            , div []
                [ input [ type_ "text", class "bg-light-blue w-80 br2 pa3 gray bn" ]
                    []
                ]
            ]
        , div [ class "blue b mb2 mt4" ] [ text <| "How old is " ++ getPetName model ++ "?" ]
        , div []
            [ div [ class "fl w-50 tc mb2" ]
                [ input [ class "dn", id "year", name "age", type_ "radio", value "year" ]
                    []
                , label [ class "health bg-white flex items-center justify-center bg-blue  pointer mw4 br1 mr2 h1 br2 white tc pa3", for "year" ]
                    [ text "0-1 years" ]
                ]
            ]
        , div []
            [ div [ class "fl w-50 tc mb2" ]
                [ input [ class "dn", id "1year", name "age", type_ "radio", value "1year" ]
                    []
                , label [ class "health bg-white flex items-center justify-center bg-blue  pointer mw4 br1 mr2 h1 br2 white tc pa3", for "1year" ]
                    [ text "1-3 years" ]
                ]
            ]
        , div []
            [ div [ class "fl w-50 tc mb4" ]
                [ input [ class "dn", id "3year", name "age", type_ "radio", value "3year" ]
                    []
                , label [ class "health bg-white flex items-center justify-center bg-blue  pointer mw4 br1 mr2 h1 br2 white tc pa3", for "3year" ]
                    [ text "3+ years" ]
                ]
            ]
        , div []
            [ div [ class "fl w-50 tc mb4" ]
                [ input [ class "dn", id "6year", name "age", type_ "radio", value "6year" ]
                    []
                , label [ class "health bg-white flex items-center justify-center bg-blue  pointer mw4 br1 mr2 h1 br2 white tc pa3", for "6year" ]
                    [ text "6+ years" ]
                ]
            , div [ class "mt4 tc w-100" ]
                [ a [ class "w-100 bg-navy br2 white pa3 br2 f4 dib link", href "#before-you-begin" ] [ text "Next" ]
                ]
            ]
        ]
