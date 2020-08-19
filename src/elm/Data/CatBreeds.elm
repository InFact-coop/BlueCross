module Data.CatBreeds exposing (..)

import Json.Decode exposing (Decoder)
import Types exposing (..)


decoderCatBreed : String -> Decoder CatBreed
decoderCatBreed val =
    case val of
        "Abyssinian" ->
            Json.Decode.succeed Abyssinian

        "American Curl" ->
            Json.Decode.succeed AmericanCurl

        "Angora" ->
            Json.Decode.succeed Angora

        "Balinese" ->
            Json.Decode.succeed Balinese

        "Bengal" ->
            Json.Decode.succeed Bengal

        "Birman" ->
            Json.Decode.succeed Birman

        "Bombay" ->
            Json.Decode.succeed Bombay

        "British Blue" ->
            Json.Decode.succeed BritishBlue

        "British Longhair" ->
            Json.Decode.succeed BritishLonghair

        "British Shorthair" ->
            Json.Decode.succeed BritishShorthair

        "British Tip" ->
            Json.Decode.succeed BritishTip

        "Burmese" ->
            Json.Decode.succeed Burmese

        "Burmilla" ->
            Json.Decode.succeed Burmilla

        "Chinchilla" ->
            Json.Decode.succeed Chinchilla

        "Colourpoint" ->
            Json.Decode.succeed Colourpoint

        "Cornish Rex" ->
            Json.Decode.succeed CornishRex

        "Cross breed" ->
            Json.Decode.succeed Crossbreed

        "Devon Rex" ->
            Json.Decode.succeed DevonRex

        "Domestic Longhair" ->
            Json.Decode.succeed DomesticLonghair

        "Domestic Semi-longhair" ->
            Json.Decode.succeed DomesticSemiLonghair

        "Domestic Shorthair" ->
            Json.Decode.succeed DomesticShorthair

        "Egyptian Mau" ->
            Json.Decode.succeed EgyptianMau

        "Exotic" ->
            Json.Decode.succeed Exotic

        "Exotic Short Hair" ->
            Json.Decode.succeed ExoticShortHair

        "Havana" ->
            Json.Decode.succeed Havana

        "Korat" ->
            Json.Decode.succeed Korat

        "Maine Coon" ->
            Json.Decode.succeed MaineCoon

        "Manx" ->
            Json.Decode.succeed Manx

        "Norwegian Forest Cat" ->
            Json.Decode.succeed NorwegianForestCat

        "Ocicat" ->
            Json.Decode.succeed Ocicat

        "Oriental" ->
            Json.Decode.succeed Oriental

        "Oriental Short Hair" ->
            Json.Decode.succeed OrientalShortHair

        "Persian" ->
            Json.Decode.succeed Persian

        "Ragdoll" ->
            Json.Decode.succeed Ragdoll

        "Russian Blue" ->
            Json.Decode.succeed RussianBlue

        "Savannah" ->
            Json.Decode.succeed Savannah

        "Scottish Fold" ->
            Json.Decode.succeed ScottishFold

        "Selkirk Rex" ->
            Json.Decode.succeed SelkirkRex

        "Siamese" ->
            Json.Decode.succeed Siamese

        "Singapura" ->
            Json.Decode.succeed Singapura

        "Snowshoe" ->
            Json.Decode.succeed Snowshoe

        "Somali" ->
            Json.Decode.succeed Somali

        "Sphynx" ->
            Json.Decode.succeed Sphynx

        "Tonkinese" ->
            Json.Decode.succeed Tonkinese

        "Turkish Angora" ->
            Json.Decode.succeed TurkishAngora

        "Turkish Van" ->
            Json.Decode.succeed TurkishVan

        _ ->
            Json.Decode.succeed CatBreedNotChosen


catBreedsList : List CatBreed
catBreedsList =
    [ Abyssinian
    , AmericanCurl
    , Angora
    , Balinese
    , Bengal
    , Birman
    , Bombay
    , BritishBlue
    , BritishLonghair
    , BritishShorthair
    , BritishTip
    , Burmese
    , Burmilla
    , Chinchilla
    , Colourpoint
    , CornishRex
    , Crossbreed
    , DevonRex
    , DomesticLonghair
    , DomesticSemiLonghair
    , DomesticShorthair
    , EgyptianMau
    , Exotic
    , ExoticShortHair
    , Havana
    , Korat
    , MaineCoon
    , Manx
    , NorwegianForestCat
    , Ocicat
    , Oriental
    , OrientalShortHair
    , Persian
    , Ragdoll
    , RussianBlue
    , Savannah
    , ScottishFold
    , SelkirkRex
    , Siamese
    , Singapura
    , Snowshoe
    , Somali
    , Sphynx
    , Tonkinese
    , TurkishAngora
    , TurkishVan
    ]
