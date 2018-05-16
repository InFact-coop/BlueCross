module Views.FindingAHome exposing (..)

import Components.StyleHelpers exposing (classes)
import Helpers exposing (getPetName, ifThenElse, onCheckboxInput, pronounConverter)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


findingAHome : Model -> Html Msg
findingAHome model =
    div [ class "w-60-ns w-90 center mw8" ]
        [ section []
            [ h2 [ class "blue f4 mv4 lh-copy" ] [ text <| "We can help you find a new home for " ++ getPetName model ++ " in a couple of different ways.  Which would suit you and " ++ getPetName model ++ " best?" ]
            ]
        , div [ class "mb3" ]
            [ input [ type_ "radio", name "supportType", id "rehomingCentre", value "Rehoming Centre", onClick ToggleRehomingCentreSupport ] []
            , label [ for "rehomingCentre", class "gray ml2" ]
                [ span [ class "b" ] [ text "Rehoming Centre: " ]
                , text <| "We will look after " ++ getPetName model ++ " at our Rehoming centre until we find " ++ pronounConverter "them" model.dogGender ++ " a great new home"
                ]
            ]
        , div [ class "mb3" ]
            [ input [ type_ "radio", name "supportType", id "homeDirect", value "Home Direct", onClick ToggleHomeDirectSupport ] []
            , label [ for "homeDirect", class "gray ml2" ]
                [ span [ class "b" ] [ text "Home Direct: " ]
                , text <| getPetName model ++ " will stay with you while we find " ++ pronounConverter "them" model.dogGender ++ " a great new home"
                ]
            ]
        , div [ class "mb3" ]
            [ input [ type_ "radio", name "supportType", id "none", value "Unsure", onClick ToggleUnsureSupport ] []
            , label [ for "none", class "gray ml2" ]
                [ span [ class "b" ] [ text "Unsure: " ]
                , text "We can talk through the options with you and you can decide what works best for you."
                ]
            ]
        , div
            [ class "mt5 tc w-100" ]
            [ a [ classes [ "link w-25-ns w-100 w-25-l w-50-m br2 white pa3 br2 f4 dib", ifThenElse (model.nextClickable == True) "bg-navy" "bg-gray disableButton o-30" ], href "#owner-info" ] [ text "Next" ]
            ]
        ]
