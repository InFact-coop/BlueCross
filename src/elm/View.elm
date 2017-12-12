module View exposing (..)

import Html exposing (..)


-- My Elm Files

import Types exposing (..)
import Components.Navbar exposing (..)
import Components.Title exposing (..)
import Routes.HomePage exposing (..)
import Routes.BeforeYouBeginPage exposing (..)
import Routes.VideoPage exposing (..)
import Routes.NewHomePage exposing (..)
import Routes.LocationPage exposing (..)
import Routes.OwnerInfoPage exposing (..)
import Routes.PersonalityPage exposing (..)
import Routes.PetInfoPage exposing (..)
import Routes.ThankYouPage exposing (..)
import Routes.ThankYouPage exposing (..)
import Routes.NotFoundPage exposing (..)


view : Model -> Html Msg
view model =
    let
        page =
            case model.route of
                HomeRoute ->
                    home model

                BeforeYouBeginRoute ->
                    beforeYouBeginPage model

                PetInfoRoute ->
                    petInfoPage model

                PersonalityRoute ->
                    personalityPage model

                LocationRoute ->
                    locationPage model

                OwnerInfoRoute ->
                    ownerInfoPage model

                ThankYouRoute ->
                    thankYouPage model

                VideoRoute ->
                    videoPage model

                NotFoundRoute ->
                    notFoundPage model

                NewHomeRoute ->
                    newHomePage model
    in
        div []
            [ navbar model
            , viewTitle model
            , page
            ]
