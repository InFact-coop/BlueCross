module Requests.UploadPhotos exposing (..)

import Http exposing (jsonBody, post)
import Json.Decode as Decode
import Json.Encode exposing (..)
import Types exposing (..)


uploadPhotos : Model -> Cmd Msg
uploadPhotos model =
    Http.send ReceivePhotoUploadStatus (photosRequest model)


photosRequest : Model -> Http.Request Bool
photosRequest model =
    post "/api/v1/upload-photos" (jsonBody <| photosArray model) (Decode.field "success" Decode.bool)


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
