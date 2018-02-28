module Data.Photos exposing (..)

import Json.Decode exposing (..)
import Types exposing (..)


imageDecoder : Decoder Image
imageDecoder =
    map2 Image
        (field "contents" string)
        (field "filename" string)


decodeImageList : Value -> Result String (List Image)
decodeImageList =
    decodeValue (list imageDecoder)


decodeSingleImage : Value -> Result String Image
decodeSingleImage =
    decodeValue imageDecoder
