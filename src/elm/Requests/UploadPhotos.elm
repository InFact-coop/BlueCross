module Requests.UploadPhotos exposing (..)

import Http exposing (jsonBody, post)
import Json.Decode as Decode exposing (decodeValue)
import Json.Decode.Pipeline exposing (..)
import Json.Encode exposing (..)
import Types exposing (..)


uploadPhotos : Model -> Cmd Msg
uploadPhotos model =
    Http.send ReceivePhotoUploadStatus (photosRequest model)


photosResponseDecoder : Decode.Decoder PhotosResponse
photosResponseDecoder =
    decode PhotosResponse
        |> required "success" Decode.bool
        |> optional "urls" (Decode.list Decode.string) []


photosRequest : Model -> Http.Request PhotosResponse
photosRequest model =
    post "/api/v1/upload-photos" (jsonBody <| photosArray model) photosResponseDecoder


photosArray : Model -> Value
photosArray model =
    list <|
        List.map photoObject (Maybe.withDefault [] model.image)


photoObject : Image -> Value
photoObject photo =
    object
        [ ( "contents", string photo.contents )
        , ( "filename", string photo.filename )
        ]
