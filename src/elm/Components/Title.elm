module Components.Title exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Helpers.GetPetName exposing (..)


viewTitle : Model -> Html Msg
viewTitle model =
    header [ class <| getClasses model.route ] [ h1 [] [ text <| getTitle model ] ]


getClasses : Route -> String
getClasses route =
    if route == ThankYouRoute then
        "dn"
    else
        "headerTitle bg-blue flex justify-center items-center white h4 mb4"


getTitle : Model -> String
getTitle model =
    case model.route of
        HomeRoute ->
            "Giving a pet"

        BeforeYouBeginRoute ->
            "Health"

        PetInfoRoute ->
            "About " ++ getPetName model

        LocationRoute ->
            "Who's looking?"

        PersonalityRoute ->
            getPetName model ++ "'s Personality"

        NewHomeRoute ->
            getPetName model ++ "'s Ideal Home"

        OwnerInfoRoute ->
            "Your details"

        ThankYouRoute ->
            ""

        VideoRoute ->
            "Photos & Videos"

        NotFoundRoute ->
            "Sorry"
