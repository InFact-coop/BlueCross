module Views.Location exposing (..)

import Helpers exposing (getPetName)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


location : Model -> Html Msg
location model =
    div [ class "ma3" ]
        [ div [ class "gray fw1 mb3" ] [ text "Enter your postcode below to see how many people in your area are interesting in dogs like yours!" ]
        , div [ class "blue b mb2" ] [ text "Where do you live?" ]
        , input [ type_ "text", class "bg-light-blue w-80 br2 pa3 gray bn" ]
            [ text "" ]
        , div [ class "gray f6 fw1 mb3" ] [ text "Please enter your postcode" ]
        , div [ class "tc gray mb3" ]
            [ text "There are currently "
            , span [ class "blue b" ]
                [ text "31" ]
            , text <| " people looking for dogs similar to " ++ getPetName model ++ " in your area!"
            ]
        , img [ src "./assets/map.svg" ] []
        , div [ class "mt4 tc w-100" ]
            [ a [ class "bg-navy br2 white pa3 br2 f4 dib link w-100 w-25-l w-50-m ", href "#owner-info" ] [ text "Next" ]
            ]
        ]
