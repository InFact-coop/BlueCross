module Routes.HomePage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)
import Components.BlueButton exposing (..)


home : Model -> Html Msg
home model =
    div [ class "w-60-ns center" ]
        [ section [ class "greeting bg-light-blue pv3 ph4" ]
            [ h2 [ class "blue tc f5" ] [ text "Thank you for choosing Blue Cross" ]
            , p [ class "gray tc" ] [ text "Giving up a pet is never easy. We want to help you find the best home for your pet. Please follow the questions and we’ll be able to find a solution for you." ]
            ]
        , div [ class "w-90 center" ] [ h2 [ class "blue f5" ] [ text "When do you need to give up your pet?" ], div [ class "grid-4 center" ] mapButtons ]
        , div [ class "banner w-100 h2 mv3" ] []
        , a [ class <| "tc center db w-90 br2 white pa3 br2 link f4 " ++ toggleNextClasses model, createNextLink model ] [ text "Next" ]
        ]


createNextLink : Model -> Attribute msg
createNextLink model =
    if model.nextClickable == True then
        attribute "href" "#before-you-begin"
    else
        attribute "id" "next"


toggleNextClasses : Model -> String
toggleNextClasses model =
    if model.nextClickable == True then
        "bg-navy white"
    else
        "bg-gray white"


mapButtons : List (Html Msg)
mapButtons =
    List.map blueButton [ "Urgently", "2-3 weeks", "In under a month", "No rush" ]
