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
    , videoMessage : String
    , messageLength : Int
    , videoStage : Stage
    , paused : Bool
    , petName : String
    }


type alias SliderValues =
    { cats : String
    , children : String
    , people : String
    }


type Stage
    = Stage0
    | Stage1
    | Stage2
    | StageErr



-- Update


type Msg
    = Change String
    | UrlChange Navigation.Location
    | MakeNextClickable
    | UpdateCatsSlider String
    | UpdateChildrenSlider String
    | UpdatePeopleSlider String
    | RecordStart String
    | RecordStop String
    | RecordError String
    | RecieveVideo String
    | ToggleVideo Stage
    | Increment
    | UpdatePetName String
