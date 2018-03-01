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
        [ div [ class "blue b mb3" ] [ text <| "Help us find " ++ getPetName model ++ " a new home they will be happy in. How does " ++ getPetName model ++ " feel about..." ]
        , div [ class "blue b mb2" ] [ text "Cats?" ]
        , div [ class "flex items-center" ]
            [ img [ src "./assets/cat.png", class "mr3" ]
                []
            , input [ id "myRange", type_ "range", value model.cats, class "w-75 h-custom bg-blue input-reset br4 slider light-border center", rangeNumberToCss model.cats, onInputValue UpdateCatsSlider ]
                []
            ]
        , loveHate model
        , div [ class "blue b mb2" ] [ text "Other dogs?" ]
        , div [ class "flex items-center" ]
            [ img [ src "./assets/dog.png", class "mr3" ]
                []
            , input [ id "myRange", type_ "range", value model.dogs, class "w-75 h-custom bg-blue input-reset br4 slider light-border center", rangeNumberToCss model.dogs, onInputValue UpdateDogsSlider ]
                []
            ]
        , loveHate model
        , div [ class "blue b mb2" ] [ text "Babies?" ]
        , div [ class " flex items-center" ]
            [ img [ src "./assets/baby.png", class "mr3" ] []
            , input [ id "myRange", type_ "range", rangeNumberToCss model.babies, value model.babies, class "w-75 h-custom bg-blue input-reset br4 slider light-border center", rangeNumberToCss model.babies, onInputValue UpdateBabiesSlider ]
                []
            ]
        , loveHate model
        , div [ class "blue b mb2" ] [ text "Children?" ]
        , div [ class " flex items-center" ]
            [ img [ src "./assets/child.png", class "mr3" ] []
            , input [ id "myRange", type_ "range", rangeNumberToCss model.children, value model.children, class "w-75 h-custom bg-blue input-reset br4 slider light-border center", rangeNumberToCss model.children, onInputValue UpdateChildrenSlider ]
                []
            ]
        , loveHate model
        , div [ class "blue b mb2" ] [ text "New People?" ]
        , div [ class " flex items-center" ]
            [ img [ src "./assets/group.png", class "mr3" ] []
            , input [ id "myRange", type_ "range", value model.people, class "w-75 h-custom bg-blue input-reset br4 slider light-border center", rangeNumberToCss model.people, onInputValue UpdatePeopleSlider ]
                []
            ]
        , loveHate model
        , div [ class "blue b mb2" ] [ text <| "Is there anything else we should know about " ++ getPetName model ++ "?" ]
        , textBox ( "Please tell us here", "newhome" )
        , div [ class "tc w-100 mt4" ]
            [ a [ class "w-100 bg-navy br2 white pa3 br2 f4 dib link w-100 w-25-l w-50-m mb5", href "#photos" ] [ text "Next" ]
            ]
        ]
