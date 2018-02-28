module Data.Photos exposing (..)

import Json.Decode exposing (..)
import Types exposing (..)


imageDecoder : Decoder ImagePortData
imageDecoder =
    map2 ImagePortData
        (field "contents" string)
        (field "filename" string)


decodeImageList : Value -> Result String (List ImagePortData)
decodeImageList =
    decodeValue (list imageDecoder)
