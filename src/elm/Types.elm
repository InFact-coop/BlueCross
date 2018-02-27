module Types exposing (..)

import Navigation


type alias Model =
    { route : Route
    , nextClickable : Bool
    , cats : String
    , children : String
    , people : String
    , videoMessage : String
    , messageLength : Int
    , videoStage : Stage
    , paused : Bool
    , petName : String
    }


type Stage
    = Stage0
    | Stage1
    | Stage2
    | StageErr


type RemoteData
    = NotAsked
    | Loading
    | ResponseFailure
    | ResponseSuccess


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


type Msg
    = NoOp
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
