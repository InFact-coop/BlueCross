module Routes.VideoPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


videoPage : Model -> Html Msg
videoPage model =
    div [ class "ma3" ]
        [ div [ class "b f4 mv4" ] [ text "So prospective owners can see Rex in all his glory, please take a photo or video!" ]
        , div [ class "videoButton bg-light-blue pa3 pointer mb2 db br1 flex flex-column justify-around items-center center" ] [ div [ class "camera" ] [], span [ class "tc f4" ] [ text "Click here to take a photo" ] ]
        , div [ class "mt3 tc" ]
            [ a [ class "db center tc w-90 bg-navy br2 white pa3 br2 f4 mv4 link", href "#location" ] [ text "Next" ]
            ]
        ]
