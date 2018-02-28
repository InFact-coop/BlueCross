module Views.Photos exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)
import Json.Decode as Decode


photos : Model -> Html Msg
photos model =
    let
        imageList =
            List.map renderImage <| Maybe.withDefault [] model.image
    in
        div [ class "ma3" ]
            ([ input
                [ type_ "file"
                , id model.imageId
                , multiple True
                , on "change"
                    (Decode.succeed ImageSelected)
                ]
                []
             , button [ onClick PreparePhoto ] [ text "Take a photo" ]
             , button [ onClick TakePhoto ] [ text "Ready!" ]
             , button [ onClick StopPhoto ] [ text "Stop Photo!" ]
             , Html.video [ autoplay True, src model.liveVideoUrl ] []
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
