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
    , sliderValues : SliderValues
    }


type alias SliderValues =
    { cats : String
    , children : String
    , people : String
    }



-- Update


type Msg
    = Change String
    | UrlChange Navigation.Location
    | MakeNextClickable
    | UpdateCatsSlider String
    | UpdateChildrenSlider String
    | UpdatePeopleSlider String
