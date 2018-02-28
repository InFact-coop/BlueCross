module Requests.PostForm exposing (..)

import Helpers exposing (stringToInt, unionTypeToString)
import Http exposing (jsonBody, post)
import Json.Decode as Decode
import Json.Encode exposing (..)
import Types exposing (..)


postForm : Model -> Cmd Msg
postForm model =
    Http.send ReceiveFormStatus (formRequest model)


formRequest : Model -> Http.Request Bool
formRequest model =
    post "/api/v1/send-form" (jsonBody <| formObject model) (Decode.field "success" Decode.bool)


formObject : Model -> Value
formObject model =
    object
        [ ( "petName", string model.petName )
        , ( "people", int (stringToInt model.people) )
        , ( "children", int (stringToInt model.children) )
        , ( "cats", int (stringToInt model.cats) )
        ]
