module Components.Title exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


viewTitle : Model -> Html Msg
viewTitle model =
    header [ class "headerTitle bg-blue flex justify-center items-center white h4" ] [ text "Hey" ]
