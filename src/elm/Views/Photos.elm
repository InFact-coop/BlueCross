module Views.Photos exposing (..)

import Components.StyleHelpers exposing (classes, displayElement)
import Helpers exposing (getPetName, ifThenElse, pronounConverter)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Decode
import Types exposing (..)


photos : Model -> Html Msg
photos model =
    let
        imageList =
            List.map renderImage <| Maybe.withDefault [] model.image
    in
    div [ class "w-60-ns w-90 center ma3 mw8 " ]
        [ header [ class "b blue f4 lh-copy" ] [ text <| "Potential owners will want to see what " ++ getPetName model ++ " looks like. Please " ++ ifThenElse model.cameraSupported "take or upload" "upload" ++ " a great photo of " ++ pronounConverter "them" model.gender ++ "!" ]
        , section []
            [ p [ class "fw1" ]
                [ img [ src "./assets/tick.svg", class "mr2 h1" ] []
                , text <| "Please let us see " ++ getPetName model ++ "'s face"
                ]
            , p [ class "fw1" ]
                [ img [ src "./assets/tick.svg", class "mr2 h1" ] []
                , text <| "We only want to see " ++ getPetName model ++ " not " ++ getPetName model ++ "'s friends!"
                ]
            , p [ class "fw1" ]
                [ img [ src "./assets/tick.svg", class "mr2 h1" ] []
                , text "Only recent photos please"
                ]
            ]
        , p [ class "blue" ] [ text " Examples of good and bad photos:" ]
        , div [ class "flex flex-wrap mb4 justify-center" ]
            [ div [ class "w-40 mr4 mw5" ]
                [ img [ src "./assets/good-photo.png", class "w-100 br2" ]
                    []
                , div [ class "w-100 flex justify-center" ] [ img [ src "./assets/good-photo-tick.svg", class "h3 w-auto margin-minus" ] [] ]
                ]
            , div [ class "w-40 mw5" ]
                [ img [ src "./assets/bad-photo.JPG", class "w-100 br2" ] []
                , div [ class "w-100 flex justify-center" ] [ img [ src "./assets/bad-photo-cross.svg", class "h3 w-auto margin-minus" ] [] ]
                ]
            ]
        , label [ for model.imageId, class "b blue" ] [ text <| ("Please " ++ ifThenElse model.cameraSupported "take or upload" "upload" ++ " a photo of " ++ getPetName model) ]
        , br [ class "pa3" ] []
        , div [ class "flex flex-wrap justify-center" ]
            [ div [ classes [ "ba w-80 vh-30 br2 b--blue ma3 mw5 grow", ifThenElse model.cameraSupported "w-40-ns" "w-70-ns" ] ]
                [ div [ class "h-100" ]
                    [ div [ class " white f4 fw1 v-mid tc center h-100 w-100 upload-background " ]
                        [ input
                            [ class "h-100 bg-pink relative w-100 pointer bg-pink dib o-0"
                            , type_ "file"
                            , id model.imageId
                            , multiple True
                            , accept "image/*"
                            , on "change"
                                (Decode.succeed ImageSelected)
                            ]
                            []
                        ]
                    ]
                , div [ class "blue tc margin-minus dn db-ns" ] [ text "Upload Image" ]
                ]
            , div [ classes [ "ba w-40-ns w-80 vh-30 br2 b--blue ma3 dn mw5 grow", ifThenElse model.cameraSupported "db-ns" "" ] ]
                [ button [ class "w-100 h-100 pointer bn blue cursor br2 bg-white", onClick PreparePhoto ]
                    [ img [ src "./assets/camera.svg", class "w4 h-auto" ] []
                    , br [] []
                    ]
                , div [ class "blue tc margin-minus dn db-ns" ] [ text "Take Photo" ]
                ]
            , div [] imageList
            , div [ class "mb3" ]
                [ Html.video [ classes [ displayElement <| model.liveVideoUrl /= "" ], autoplay True, src model.liveVideoUrl ]
                    []
                , div [ class "w-100 tc center flex justify-center" ]
                    [ div []
                        [ button [ classes [ displayElement <| model.liveVideoUrl /= "" ], class "mh3 bn bg-blue br-100 h3 w3 white dim pointer pa2", onClick TakePhoto ]
                            [ img [ src "./assets/white-camera.png", class "w2 center" ] [] ]
                        , p [ classes [ displayElement <| model.liveVideoUrl /= "" ], class "gray fw1 mt1" ] [ text "Take Photo" ]
                        ]
                    , div []
                        [ button [ classes [ displayElement <| model.liveVideoUrl /= "" ], class "mh3 bn bg-green br-100 h3 w3 white dim pointer pa2", onClick StopPhoto ]
                            [ img [ src "./assets/white-tick.png", class "w2 center" ] [] ]
                        , p [ classes [ displayElement <| model.liveVideoUrl /= "" ], class "gray fw1 mt1" ] [ text "Finish" ]
                        ]
                    ]
                ]
            , div [ class "mt4 tc w-100" ]
                [ a [ classes [ "link w-25-ns w-100 br2 white pa3 br2 f4 dib", ifThenElse (model.nextClickable == True) "bg-navy" "bg-gray disableButton o-30" ], href "#finding-home", onClick UploadPhotos ] [ text "Next" ]
                ]
            ]
        ]


renderImage : Image -> Html Msg
renderImage image =
    div [ class "dib w-40-ns w-80 h-auto mh4 mv2 br2" ]
        [ span [ class "white dib diagonally-se b pointer grow", onClick <| DeleteImage image ] [ text "X" ]
        , img
            [ src image.contents
            , title image.filename
            ]
            []
        ]
