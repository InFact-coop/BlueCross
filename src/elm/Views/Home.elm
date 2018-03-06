module Views.Home exposing (..)

import Components.BlueButton exposing (..)
import Data.Home exposing (timeScaleTypes)
import Html exposing (..)
import Html.Attributes exposing (..)
import TransitStyle exposing (..)
import Types exposing (..)


home : Model -> Html Msg
home model =
    div [ class "w-60-ns w-90 center", style (TransitStyle.fadeSlide 2 model.transition) ]
        [ section [ class "greeting bg-light-blue pv3 ph4 br2" ]
            [ h2 [ class "blue tc f4" ] [ text "Thank you for choosing Blue Cross" ]
            , p [ class "gray tc ph4-l lh-copy" ] [ text "Finding the right home for your pet is never easy, Blue Cross is here to help.  Please answer the following questions about your pet, we will then be in touch within 2 days to get started." ]
            ]
        , div [ class "w-100 center" ] [ h2 [ class "blue f5 pt4-ns" ] [ text "When do you need to rehome your pet?" ], div [ class "center" ] urgencyButtons ]
        , br [] []
        , p [ class "tc gray fw1 mb1" ] [ text "By continuing you agree to our" ]
        , p [ class "tc mt1" ] [ a [ href "https://www.bluecross.org.uk/terms-and-conditions", class "tc fw1 blue mt1 no-underline link", target "blank" ] [ text "terms of services" ] ]
        , a [ class <| "tc center flex justify-center w-100 w-25-l w-50-m br2 white pa3 br2 link f4 " ++ toggleNextClasses model, createNextLink model ] [ text "Next" ]
        ]


createNextLink : Model -> Attribute msg
createNextLink model =
    if model.nextClickable == True then
        attribute "href" "#pet-info"
    else
        attribute "id" "next"


toggleNextClasses : Model -> String
toggleNextClasses model =
    if model.nextClickable == True then
        "bg-navy white"
    else
        "bg-gray white"


urgencyButtons : List (Html Msg)
urgencyButtons =
    List.map blueButton timeScaleTypes
