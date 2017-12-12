module Types exposing (..)

import Navigation


-- Model


type Route
    = HomeRoute
    | BeforeYouBeginRoute
    | PetInfoRoute
    | LocationRoute
    | PersonalityRoute
    | OwnerInfoRoute
    | ThankYouRoute
    | NotFoundRoute
    | VideoRoute
    | NewHomeRoute


type alias Model =
    { route : Route
    , userInput : String
    , nextClickable : Bool
    , rangeNumber : String
    }



-- Update


type Msg
    = Change String
    | UrlChange Navigation.Location
    | MakeNextClickable
    | UpdateValue String
