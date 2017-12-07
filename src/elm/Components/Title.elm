module Components.Title exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


viewTitle : Model -> Html Msg
viewTitle model =
    header [ class "headerTitle bg-blue flex justify-center items-center white h4" ] [ p [] [ text <| getTitle model.route ] ]


getTitle : Route -> String
getTitle route =
    case route of
        HomeRoute ->
            "Welcome"

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
