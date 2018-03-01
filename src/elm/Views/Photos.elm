module Views.Photos exposing (..)

import Components.StyleHelpers exposing (classes, displayElement)
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
        div [ class "ma3" ]
            ([ label [ for model.imageId ] [ text "Upload your Own Photos" ]
             , input
                [ type_ "file"
                , id model.imageId
                , multiple True
                , accept "image/*"
                , on "change"
                    (Decode.succeed ImageSelected)
                ]
                []
             , div []
                [ button [ class "mh2", onClick PreparePhoto ] [ text "1. Want to take a Photo?" ]
                , button [ class "mh2", onClick TakePhoto ] [ text "2. Lights, Camera, Action!" ]
                , button [ class "mh2", onClick StopPhoto ] [ text "3. I'm Done Taking Photos!" ]
                , button [ class "mh2", onClick UploadPhotos ] [ text "4. Upload My Photos To The Cloud!" ]
                ]
             , Html.video [ classes [ displayElement <| model.liveVideoUrl /= "" ], autoplay True, src model.liveVideoUrl ] []
             , div [ class "mt4 tc w-100" ]
                [ a [ class "w-100 bg-navy br2 white pa3 br2 f4 dib no-underline", href "#location" ] [ text "Next" ]
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
