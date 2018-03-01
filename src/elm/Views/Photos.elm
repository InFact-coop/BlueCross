module Views.Photos exposing (..)

import Components.StyleHelpers exposing (classes, displayElement)
import Helpers exposing (getPetName)
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
    div [ class "w-60-ns w-90 center ma3 " ]
        ([ header [ class "b blue" ] [ text "So potential owners can see what Max looks like we would love to see a photo!" ]
         , section []
            [ p [ class "fw1" ]
                [ img [ src "./assets/tick.png", class "mr2" ] []
                , text <| "Please let us see " ++ getPetName model ++ "'s face"
                ]
            , p [ class "fw1" ]
                [ img [ src "./assets/tick.png", class "mr2" ] []
                , text <| "We only want to see " ++ getPetName model ++ " not " ++ getPetName model ++ "'s friends!"
                ]
            , p [ class "fw1" ]
                [ img [ src "./assets/tick.png", class "mr2" ] []
                , text "Only recent photos please"
                ]
            ]
         , label [ for model.imageId, class "b blue" ] [ text <| ("Please take or upload a photo of " ++ getPetName model) ]
         , br [ class "pa3" ] []
         , div [ class "flex flex-wrap justify-center" ]
            [ div [ class "ba w-40-ns w-80 vh-40-ns br2 b--blue ma3 " ]
                [ div [ class "h-100" ]
                    [ div [ class " white f4 fw1  v-mid tc center h-100 w-100 upload-background " ]
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

                    -- , div [ class "h-75 flex items-center" ] [ img [ src "./assets/upload.png", class " tc center flex v-mid w3 w4-ns" ] [ text "hello" ] ]
                    ]
                , div [ class "blue tc margin-minus dn db-ns" ] [ text "Upload Image" ]
                ]
            , div [ class "ba w-40-ns w-80 vh-25 vh-40-ns br2 b--blue ma3" ]
                [ button [ class "w-100  h-100 pointer bn blue cursor", onClick PreparePhoto ]
                    [ img [ src "./assets/camera.png", class "w4 h-auto" ] []
                    , br [] []
                    ]
                , div [ class "blue tc margin-minus dn db-ns" ] [ text "Take Photo" ]

                -- , button [ class "mh2", onClick TakePhoto ] [ text "2. Lights, Camera, Action!" ]
                -- , button [ class "mh2", onClick StopPhoto ] [ text "3. I'm Done Taking Photos!" ]
                -- , button [ class "mh2", onClick UploadPhotos ] [ text "4. Upload My Photos To The Cloud!" ]
                ]
            , Html.video [ classes [ displayElement <| model.liveVideoUrl /= "" ], autoplay True, src model.liveVideoUrl ] []
            , div [ class "mt4 tc w-100" ]
                [ a [ class "link w-25-ns w-100 bg-navy br2 white pa3 br2 f4 dib", href "#finding-home" ] [ text "Next" ]
                ]
            ]
         ]
            ++ imageList
        )


renderImage : Image -> Html Msg
renderImage image =
    img
        [ src image.contents
        , title image.filename
        ]
        []
