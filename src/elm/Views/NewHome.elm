module Views.NewHome exposing (..)

import Components.LovesHates exposing (..)
import Components.StyleHelpers exposing (classes)
import Components.TextBox exposing (..)
import Helpers exposing (getPetName, ifThenElse, pronounConverter, onEventValue)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, targetValue)
import Types exposing (..)


rangeNumberToCss : Bool -> String -> Attribute msg
rangeNumberToCss isIE range =
    let
        gradient =
            "linear-gradient(to right, #069FDD, #069FDD " ++ range ++ "%, #FFF 1%, #FFF 100%)"

        ieStyle =
            [ ( "", "" ) ]

        normalStyle =
            [ ( "backgroundImage", gradient ) ]
    in
        style <| ifThenElse isIE ieStyle normalStyle


slider : Model -> String -> (String -> Msg) -> Html Msg
slider model stringifiedVal msg =
    let
        sliderEvent =
            onEventValue <| ifThenElse model.isIE "change" "input"
    in
        div [ class "w-100 items-center center tc" ]
            [ input [ type_ "range", value stringifiedVal, classes [ "b--gray w-75 pa0 input-reset br4 slider light-border center outline-0", ifThenElse model.isIE "ms-h-custom" "h-custom light-border" ], rangeNumberToCss model.isIE stringifiedVal, sliderEvent msg ]
                []
            , loveHate model
            ]


newHome : Model -> Html Msg
newHome model =
    div [ class "w-60-ns w-90 center mw8" ]
        [ div [ class "blue b mb3 f4 lh-copy" ] [ text <| "Help us find " ++ getPetName model ++ " a new home " ++ pronounConverter "they" model.dogGender ++ " will be happy in. Please use the sliders to show us how " ++ getPetName model ++ " feels about..." ]
        , div [ class "blue b mb2 " ]
            [ text "Cats?"
            , span [ class "fw1 f5" ] [ text " Required" ]
            ]
        , div [ class "flex" ]
            [ div [ class "w2 h2" ]
                [ img [ src "./assets/catIcon.svg", class "mr3 h2 " ]
                    []
                ]
            , slider model model.cats UpdateCatsSlider
            ]
        , div [ class "blue b mb2 " ]
            [ text "Other dogs?"
            , span [ class "fw1 f5" ] [ text " Required" ]
            ]
        , div [ class "flex" ]
            [ div [ class "w2 h2" ]
                [ img [ src "./assets/dogIcon.svg", class "mr3 h2 " ]
                    []
                ]
            , slider model model.dogs UpdateDogsSlider
            ]
        , div [ class "blue b mb2 " ] [ text "Young Children?" ]
        , div [ class " flex" ]
            [ div [ class "w2 h2" ]
                [ img [ src "./assets/baby.svg", class "mr3 h2 " ] [] ]
            , slider model model.babies UpdateBabiesSlider
            ]
        , div [ class "blue b mb2 " ] [ text "Older Children?" ]
        , div [ class " flex " ]
            [ div [ class "w2 h2" ]
                [ img [ src "./assets/child.svg", class "mr3 h2 " ] [] ]
            , slider model model.children UpdateChildrenSlider
            ]
        , div [ class "blue b mb2 " ] [ text "New People?" ]
        , div [ class " flex" ]
            [ div [ class "w2 h2" ]
                [ img [ src "./assets/group.svg", class "mr3 h2 " ] [] ]
            , slider model model.people UpdatePeopleSlider
            ]
        , div [ class "blue b mb2" ] [ text <| "Is there anything else we should know about " ++ getPetName model ++ "?" ]
        , newTextBox ( "Please tell us here", "newhome" ) UpdateOtherGeneral
        , div [ class "tc w-100 mt4" ]
            [ a [ classes [ "w-100 br2 white pa3 br2 f4 dib link w-100 w-25-l w-50-m", ifThenElse (model.nextClickable == True) "bg-navy" "bg-gray disableButton o-30" ], href "#photos" ] [ text "Next" ]
            ]
        ]
