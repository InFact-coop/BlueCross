module Views.Photos exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)
import Json.Decode as Decode


-- import Helpers exposing (getPetName)


photos : Model -> Html Msg
photos model =
    let
        imagePreview =
            case model.image of
                Just i ->
                    viewImagePreview i

                Nothing ->
                    text ""
    in
        div [ class "ma3" ]
            [ input
                [ type_ "file"
                , id model.imageId
                , on "change"
                    (Decode.succeed ImageSelected)
                ]
                []
            , imagePreview
            ]


viewImagePreview : Image -> Html Msg
viewImagePreview image =
    img
        [ src image.contents
        , title image.filename
        ]
        []
