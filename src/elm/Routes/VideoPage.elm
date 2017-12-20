module Routes.VideoPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)
import Helpers.GetPetName exposing (..)


videoPage : Model -> Html Msg
videoPage model =
    div [ class "ma3" ]
        [ div [ class "gray fw1 mb4" ] [ text <| "So new owners can see " ++ getPetName model ++ " in all his glory, please take a short video of them!" ]
        , videoButton model
        , div [ class "mt4 tc w-100" ]
            [ a [ class "w-100 bg-navy br2 white pa3 br2 f4 dib no-underline", href "#location" ] [ text "Next" ]
            ]
        ]


createNextLink : Model -> Attribute msg
createNextLink model =
    if model.nextClickable == True then
        attribute "href" "#location"
    else
        attribute "id" "next"


toggleNextClasses : Model -> String
toggleNextClasses model =
    if model.nextClickable == True then
        "bg-navy white"
    else
        "bg-gray white"


videoButton : Model -> Html Msg
videoButton model =
    case model.videoStage of
        Stage0 ->
            div [ class "videoButton bg-light-blue pa3 pointer mb2 db br2 flex flex-column justify-around items-center center", onClick (ToggleVideo model.videoStage) ] [ div [ class "camera" ] [], span [ class "tc f4" ] [ text <| "Click here to take a video of " ++ getPetName model ] ]

        Stage1 ->
            div [ class "videoButton bg-light-blue pa3 pointer mb2 db br2 flex flex-column justify-around items-center center", onClick (ToggleVideo model.videoStage) ] [ div [ class "record" ] [], span [ class "tc f4" ] [ text "Click to finish video" ] ]

        Stage2 ->
            video [ autoplay True, src model.videoMessage, preload "auto", class "video db center" ] []

        StageErr ->
            a [ class "black link db videoButton bg-light-blue pa3 pointer mb2 db br2 flex flex-column justify-around items-center center", href "#location" ] [ div [ class "stop" ] [], span [ class "tc f4" ] [ text <| "Sorry, we couldn't film " ++ getPetName model ++ "! Please click here to continue." ] ]
