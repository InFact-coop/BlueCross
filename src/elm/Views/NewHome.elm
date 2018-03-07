module Views.NewHome exposing (..)

import Components.LovesHates exposing (..)
import Components.TextBox exposing (..)
import Helpers exposing (getPetName)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, targetValue)
import Json.Decode as Json
import Types exposing (..)


onInputValue : (String -> msg) -> Attribute msg
onInputValue tagger =
    on "input" (Json.map tagger targetValue)


rangeNumberToCss : String -> Attribute msg
rangeNumberToCss range =
    let
        gradient =
            "linear-gradient(to right, #069FDD, #069FDD " ++ range ++ "%, #FFF 1%, #FFF 100%)"
    in
    style
        [ ( "backgroundImage", gradient ) ]


newHome : Model -> Html Msg
newHome model =
    div [ class "w-60-ns w-90 center" ]
        [ div [ class "blue b mb3 f4 lh-copy" ] [ text <| "Help us find " ++ getPetName model ++ " a new home they will be happy in. How does " ++ getPetName model ++ " feel about..." ]
        , div [ class "blue b mb2 " ]
            [ text "Cats?"
            , span [ class "fw1 f5" ] [ text " Required" ]
            ]
        , div [ class "flex" ]
            [ div [ class "w2 h2" ]
                [ img [ src "./assets/catIcon.svg", class "mr3 h2 " ]
                    []
                ]
            , div [ class "w-100 items-center center tc" ]
                [ input [ id "myRange", type_ "range", value model.cats, class "w-75 h-custom bg-blue input-reset br4 slider light-border center outline-0 outline-0", rangeNumberToCss model.cats, onInputValue UpdateCatsSlider ]
                    []
                , loveHate model
                ]
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
            , div [ class "w-100 items-center center tc" ]
                [ input [ id "myRange", type_ "range", value model.dogs, class "w-75 h-custom bg-blue input-reset br4 slider light-border center outline-0", rangeNumberToCss model.dogs, onInputValue UpdateDogsSlider ]
                    []
                , loveHate model
                ]
            ]
        , div [ class "blue b mb2 " ] [ text "Young Children?" ]
        , div [ class " flex" ]
            [ div [ class "w2 h2" ]
                [ img [ src "./assets/baby.svg", class "mr3 h2 " ] [] ]
            , div [ class "w-100 items-center center tc" ]
                [ input [ id "myRange", type_ "range", rangeNumberToCss model.babies, value model.babies, class "w-75 h-custom bg-blue input-reset br4 slider light-border center outline-0", rangeNumberToCss model.babies, onInputValue UpdateBabiesSlider ]
                    []
                , loveHate model
                ]
            ]
        , div [ class "blue b mb2 " ] [ text "Older Children?" ]
        , div [ class " flex " ]
            [ div [ class "w2 h2" ]
                [ img [ src "./assets/child.svg", class "mr3 h2 " ] [] ]
            , div [ class "w-100 items-center center tc" ]
                [ input [ id "myRange", type_ "range", rangeNumberToCss model.children, value model.children, class "w-75 h-custom bg-blue input-reset br4 slider light-border center outline-0", rangeNumberToCss model.children, onInputValue UpdateChildrenSlider ]
                    []
                , loveHate model
                ]
            ]
        , div [ class "blue b mb2 " ] [ text "New People?" ]
        , div [ class " flex" ]
            [ div [ class "w2 h2" ]
                [ img [ src "./assets/group.svg", class "mr3 h2 " ] [] ]
            , div [ class "w-100 items-center center tc" ]
                [ input [ id "myRange", type_ "range", value model.people, class "w-75 h-custom bg-blue input-reset br4 slider light-border center outline-0", rangeNumberToCss model.people, onInputValue UpdatePeopleSlider ]
                    []
                , loveHate model
                ]
            ]
        , div [ class "blue b mb2" ] [ text <| "Is there anything else we should know about " ++ getPetName model ++ "?" ]
        , newTextBox ( "Please tell us here", "newhome" ) UpdateOtherGeneral
        , div [ class "tc w-100 mt4" ]
            [ a [ class "bg-navy br2 white pa3 br2 f4 dib link w-100 w-25-l w-50-m ", href "#photos" ] [ text "Next" ]
            ]
        ]
