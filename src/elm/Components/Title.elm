module Components.Title exposing (..)

import Helpers exposing (getPetName)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


viewTitle : Model -> Html Msg
viewTitle model =
    header [ class <| getClasses model.route ] [ h1 [] [ text <| getTitle model ] ]


getClasses : Route -> String
getClasses route =
    if route == ThankYouRoute then
        "dn"
    else
        "flex justify-center items-center dark-blue h4 mb2 tc"


getTitle : Model -> String
getTitle model =
    case model.route of
        HomeRoute ->
            "Find a new home for your pet"

        BeforeYouBeginRoute ->
            getPetName model ++ "'s Health"

        PetInfoRoute ->
            "About " ++ getPetName model

        PersonalityRoute ->
            getPetName model ++ "'s Personality"

        NewHomeRoute ->
            getPetName model ++ "'s New Home"

        OwnerInfoRoute ->
            "Your details"

        ThankYouRoute ->
            ""

        VideoRoute ->
            "Photos & Videos"

        FindingAHomeRoute ->
            "Finding a new home for " ++ getPetName model

        NotFoundRoute ->
            "Sorry"
