module Helpers exposing (..)

import Dom.Scroll exposing (..)
import Regex exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Json.Decode as Decode
import Regex exposing (..)
import Task
import Types exposing (..)
import Json.Decode as Json


onEventValue : String -> (String -> msg) -> Attribute msg
onEventValue event tagger =
    on event (Json.map tagger targetValue)


ifThenElse : Bool -> a -> a -> a
ifThenElse conditional trueCase falseCase =
    if conditional then
        trueCase
    else
        falseCase


unionTypeToString : a -> String
unionTypeToString a =
    Regex.replace All
        (Regex.regex "[A-Z]{1,10}|[0-9]{1,10}")
        (\{ match } -> " " ++ match)
        (toString a)
        |> String.trim


unionTypePayloadToString : a -> (a -> Msg) -> String
unionTypePayloadToString payload msg =
    let
        msgString =
            unionTypeToString (msg payload)

        payloadLength =
            unionTypeToString (payload) |> String.length |> (+) 2
    in
        String.dropRight payloadLength msgString


unionTypePayloadToClass : a -> (a -> Msg) -> String
unionTypePayloadToClass payload msg =
    let
        msgString =
            toString (msg payload)

        payloadLength =
            toString (payload) |> String.length |> (+) 1
    in
        String.dropRight payloadLength msgString |> String.toLower


removeSpaces : String -> String
removeSpaces string =
    string
        |> String.toLower
        |> String.words
        |> String.join ""


scrollToTop : Cmd Msg
scrollToTop =
    Task.attempt (always NoOp) (toTop "container")


prettifyNumber : Int -> String
prettifyNumber number =
    let
        numberString =
            toString number
    in
        if String.length numberString > 3 then
            String.dropRight 3 numberString ++ "," ++ String.right 3 numberString
        else
            numberString


getPetName : Model -> String
getPetName model =
    if model.petName == "" then
        "your dog"
    else
        model.petName


stringToInt : String -> Int
stringToInt stringifiedNumber =
    Result.withDefault 0 <| String.toInt stringifiedNumber


isNewListEntry : String -> List String -> Bool
isNewListEntry string stringList =
    List.member string stringList
        |> not


checkEmail : String -> Maybe Bool
checkEmail email =
    let
        match =
            Regex.find (AtMost 1) (Regex.regex "^(([^<>()\\[\\]\\.,;:\\s@\"]+(\\.[^<>()\\[\\]\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$") email |> List.head
    in
        case match of
            Just x ->
                Just <| x.match == email

            Nothing ->
                Just False


pronounConverter : String -> Gender -> String
pronounConverter neutralForm gender =
    case neutralForm of
        "they" ->
            case gender of
                Male ->
                    "he"

                Female ->
                    "she"

                GenderNotChosen ->
                    "they"

        "them" ->
            case gender of
                Male ->
                    "him"

                Female ->
                    "her"

                GenderNotChosen ->
                    "them"

        _ ->
            neutralForm


sanitisePhoneNumber : String -> String
sanitisePhoneNumber string =
    replace All (regex "[^\\d ()+]") (\_ -> "") string


sanitisePostCode : String -> String
sanitisePostCode string =
    replace All (regex "[^\\d a-zA-Z]") (\_ -> "") string


onCheckboxInput : (String -> Bool -> msg) -> Html.Attribute msg
onCheckboxInput tagger =
    on "change" (Decode.map2 tagger targetValue targetChecked)


onBlurValue : (String -> msg) -> Attribute msg
onBlurValue tagger =
    on "blur" (Decode.map tagger targetValue)
