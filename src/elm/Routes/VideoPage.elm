module Routes.VideoPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


videoPage : Model -> Html Msg
videoPage model =
    div [ class "ma3" ]
        [ div [ class "b f4 mv4" ] [ text "So prospective owners can see Rex in all his glory, please take a photo or video!" ]
        , videoButton model
        , div [ class "mt3 tc" ]
            [ a
                [ class <| "tc center db w-90 br2 white pa3 br2 link f4 " ++ toggleNextClasses model, createNextLink model ]
                [ text "Next" ]
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
            div [ class "videoButton bg-light-blue pa3 pointer mb2 db br1 flex flex-column justify-around items-center center", onClick (ToggleVideo model.videoStage) ] [ div [ class "camera" ] [], span [ class "tc f4" ] [ text "Click here to take a video of Rex" ] ]

        Stage1 ->
            div [ class "videoButton bg-light-blue pa3 pointer mb2 db br1 flex flex-column justify-around items-center center", onClick (ToggleVideo model.videoStage) ] [ div [ class "record" ] [], span [ class "tc f4" ] [ text "Click to finish video" ] ]

        Stage2 ->
            video [ autoplay True, src model.videoMessage, preload "auto", class "video db center" ] []
