module Router exposing (..)

import Components.Navbar exposing (..)
import Components.Title exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Navigation exposing (..)
import Types exposing (..)
import Views.BeforeYouBegin exposing (..)
import Views.Home exposing (..)
import Views.Location exposing (..)
import Views.NewHome exposing (..)
import Views.NotFound exposing (..)
import Views.OwnerInfo exposing (..)
import Views.Personality exposing (..)
import Views.PetInfo exposing (..)
import Views.ThankYou exposing (..)
import Views.Video as VideoView


view : Model -> Html Msg
view model =
    let
        view =
            getCurrentView model
    in
    div [ class "w-100 fixed overflow-y-scroll top-0 bottom-0 m0-auto cover", id "container" ]
        [ navbar model
        , viewTitle model
        , view
        ]


getCurrentView : Model -> Html Msg
getCurrentView model =
    case model.route of
        HomeRoute ->
            Views.Home.home model

        BeforeYouBeginRoute ->
            beforeYouBegin model

        PetInfoRoute ->
            petInfo model

        PersonalityRoute ->
            personality model

        LocationRoute ->
            location model

        OwnerInfoRoute ->
            ownerInfo model

        ThankYouRoute ->
            thankYou model

        VideoRoute ->
            VideoView.video model

        NotFoundRoute ->
            notFound model

        NewHomeRoute ->
            newHome model


getRoute : String -> Route
getRoute hash =
    case hash of
        "#home" ->
            HomeRoute

        "" ->
            HomeRoute

        "#before-you-begin" ->
            BeforeYouBeginRoute

        "#pet-info" ->
            PetInfoRoute

        "#location" ->
            LocationRoute

        "#personality" ->
            PersonalityRoute

        "#owner-info" ->
            OwnerInfoRoute

        "#thank-you" ->
            ThankYouRoute

        "#upload-video" ->
            VideoRoute

        "#new-home" ->
            NewHomeRoute

        _ ->
            NotFoundRoute


viewFromUrl : Navigation.Location -> Model -> Model
viewFromUrl location model =
    let
        view =
            getRoute location.hash
    in
    { model | route = view }
