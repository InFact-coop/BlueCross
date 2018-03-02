module Helpers exposing (..)

import Dom.Scroll exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Decode
import Regex exposing (..)
import Task
import Types exposing (..)


ifThenElse : Bool -> a -> a -> a
ifThenElse conditional trueCase falseCase =
    if conditional then
        trueCase
    else
        falseCase


unionTypeToString : a -> String
unionTypeToString a =
    Regex.replace All
        (Regex.regex "[A-Z]|[0-9]")
        (\{ match } -> " " ++ match)
        (toString a)
        |> String.trim


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
        "Your dog"
    else
        model.petName


stringToInt : String -> Int
stringToInt stringifiedNumber =
    Result.withDefault 0 <| String.toInt stringifiedNumber


isNewListEntry : String -> List String -> Bool
isNewListEntry string stringList =
    List.member string stringList
        |> not


onCheckboxInput : (String -> Bool -> msg) -> Html.Attribute msg
onCheckboxInput tagger =
    on "change" (Decode.map2 tagger targetValue targetChecked)
