module Requests.Postcode exposing (..)

import Types exposing (..)
import Http exposing (..)
import Json.Decode exposing (..)


validatePostcode : String -> Cmd Msg
validatePostcode postcode =
    let
        url =
            "https://api.postcodes.io/postcodes/" ++ postcode ++ "/validate"

        request =
            Http.get url (field "result" bool)
    in
        Http.send ReceivePostcodeValidity request
