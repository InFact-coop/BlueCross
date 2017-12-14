module Routes.NewHomePage exposing (..)

import Helpers.GetPetName exposing (..)
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


newHomePage : Model -> Html Msg
newHomePage model =
    let
        catValue =
            model.sliderValues.cats

        childrenValue =
            model.sliderValues.children

        peopleValue =
            model.sliderValues.people
    in
    div [ class "ma3" ]
        [ div [ class "gray mb3" ] [ text <| "So that we find " ++ getPetName model ++ " a new home they love, where would he put his paws?" ]
        , div [ class "blue b mb2" ] [ text "Cats?" ]
        , div [ class "flex items-center" ]
            [ img [ src "./assets/cat.svg", class "mr3" ]
                []
            , input [ id "myRange", type_ "range", value catValue, class "w-75 h-custom bg-blue input-reset br4 slider light-border", rangeNumberToCss catValue, onInputValue UpdateCatsSlider ]
                []
            ]
        , div
            [ class "flex justify-around mb5" ]
            [ div [ class "gray fw1 mr4" ] [ text "No thanks!" ]
            , div [ class "gray fw1 ml4" ] [ text "Loves!" ]
            ]
        , div [ class "blue b mb2" ] [ text "Children?" ]
        , div [ class " flex items-center" ]
            [ img [ src "./assets/baby.svg", class "mr3" ] []
            , input [ id "myRange", type_ "range", rangeNumberToCss childrenValue, value childrenValue, class "w-75 h-custom bg-blue input-reset br4 slider light-border", onInputValue UpdateChildrenSlider ]
                []
            ]
        , div
            [ class "flex justify-around mb5" ]
            [ div [ class "gray fw1 mr4" ] [ text "No thanks!" ]
            , div [ class "gray fw1 ml4" ] [ text "Loves!" ]
            ]
        , div [ class "blue b mb2" ] [ text "Unfamilar People?" ]
        , div [ class " flex items-center" ]
            [ img [ src "./assets/people.svg", class "mr3" ] []
            , input [ id "myRange", type_ "range", value peopleValue, class "w-75 h-custom bg-blue input-reset br4 slider light-border", rangeNumberToCss peopleValue, onInputValue UpdatePeopleSlider ]
                []
            ]
        , div
            [ class "flex justify-around mb5" ]
            [ div [ class "gray fw1 mr4" ] [ text "No thanks!" ]
            , div [ class "gray fw1 ml4" ] [ text "Loves!" ]
            ]
        , div [ class "tc w-100" ]
            [ a [ class "w-100 bg-navy br2 white pa3 br2 f4 dib link", href "#upload-video" ] [ text "Next" ]
            ]
        ]
