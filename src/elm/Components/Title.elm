module Components.Title exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


viewTitle : Model -> Html Msg
viewTitle model =
    header [ class <| getClasses model.route ] [ h1 [] [ text <| getTitle model.route ] ]


getClasses : Route -> String
getClasses route =
    if route == ThankYouRoute then
        "dn"
    else
        "headerTitle bg-blue flex justify-center items-center white h4 mb4"


getTitle : Route -> String
getTitle route =
    case route of
        HomeRoute ->
            "Giving a pet"

        BeforeYouBeginRoute ->
            "Before You Begin"

        PetInfoRoute ->
            "Pet Info"

        LocationRoute ->
            "Location"

        PersonalityRoute ->
            "Personality"

        LikesRoute ->
            "The Ideal Home"

        OwnerInfoRoute ->
            "Owner Info"

        ThankYouRoute ->
            ""

        NotFoundRoute ->
            "Sorry"
