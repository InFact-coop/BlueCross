module Types exposing (..)

import Navigation


-- Model


type Route
    = HomeRoute
    | BeforeYouBeginRoute
    | PetInfoRoute
    | LocationRoute
    | PersonalityRoute
    | LikesRoute
    | OwnerInfoRoute
    | ThankYouRoute
    | NotFoundRoute
    | VideoRoute


type alias Model =
    { route : Route
    , userInput : String
    }



-- Update


type Msg
    = Change String
    | UrlChange Navigation.Location
