module Routes.LocationPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


locationPage : Model -> Html Msg
locationPage model =
    div [ class "ma3" ]
        [ div [ class "blue b mb2" ] [ text "Where do you live?" ]
        , input [ type_ "text", class "bg-light-blue w-80 br2 pa3 gray bn" ]
            [ text "" ]
        , div [ class "gray f6 fw1 mb3" ] [ text "Please enter your postcode" ]
        , div [ class "tc gray mb3" ]
            [ text "There are currently "
            , span [ class "blue b" ]
                [ text "31" ]
            , text " people looking for dogs similar to yours in your area!"
            ]
        , img [ src "./assets/map.svg" ] []
        , div [ class "mt4 tc w-100" ]
            [ a [ class "w-100 bg-navy br2 white pa3 br2 f4 dib", href "#owner-info-page" ] [ text "Next" ]
            ]
        ]
