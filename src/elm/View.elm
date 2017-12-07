module View exposing (..)

import Html exposing (..)


-- My Elm Files

import Types exposing (..)
import Components.Navbar exposing (..)
import Routes.HomePage exposing (..)
import Routes.BeforeYouBeginPage exposing (..)
import Routes.LikesPage exposing (..)
import Routes.LocationPage exposing (..)
import Routes.OwnerInfoPage exposing (..)
import Routes.PersonalityPage exposing (..)
import Routes.PetInfoPage exposing (..)
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
                    
                LocationRoute ->
                    locationPage model
                    
                PersonalityRoute ->
                    personalityPage model
                    
                LikesRoute ->
                    likesPage model
                    
                OwnerInfoRoute ->
                    ownerInfoPage model
                    
                ThankYouRoute ->
                    thankYouPage model         
                    
                NotFoundRoute ->
                    notFoundPage model
                    

    in
        div []
            [ navbar model
            , page
            ]
