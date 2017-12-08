module Routes.LocationPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


locationPage : Model -> Html Msg
locationPage model =
    div [ class "ma3" ]
        [ div [ class "gray mb3" ] [ text "So that we find your dog a new home he loves, where would he put his paws?" ]
        , div [ class "blue b mb2" ] [ text "Cats?" ]
        , div [ class "flex items-center" ]
            [ img [ src "./assets/cat.svg", class "mr3" ] []
            , input [ id "myRange", type_ "range", value "50", class "w-75 h-custom bg-blue input-reset br4 slider" ]
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
            , input [ id "myRange", type_ "range", value "50", class "w-75 h-custom bg-blue input-reset br4 slider" ]
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
            , input [ id "myRange", type_ "range", value "50", class "w-75 h-custom bg-blue input-reset br4 slider" ]
                []
            ]
        , div
            [ class "flex justify-around mb5" ]
            [ div [ class "gray fw1 mr4" ] [ text "No thanks!" ]
            , div [ class "gray fw1 ml4" ] [ text "Loves!" ]
            ]
        , div [ class "tc w-100" ]
            [ a [ class "w-100 bg-navy br2 white pa3 br2 f4 dib", href "" ] [ text "Next" ]
            ]
        ]
