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
    let
        petName =
            getPetName model
    in
        case model.route of
            HomeRoute ->
                "Find a new home for your dog"

            BeforeYouBeginRoute ->
                petName ++ "'s Health"

            PetInfoRoute ->
                "About " ++ petName

            PersonalityRoute ->
                petName ++ "'s Personality"

            PhotosRoute ->
                "Photos of " ++ petName

            NewHomeRoute ->
                petName ++ "'s New Home"

            OwnerInfoRoute ->
                "Your details"

            ThankYouRoute ->
                ""

            FindingAHomeRoute ->
                "Finding a new home for " ++ petName

            NotFoundRoute ->
                "Sorry"
