module Types exposing (..)

import Navigation
import Http exposing (..)


type alias Model =
    { route : Route
    , nextClickable : Bool
    , cats : String
    , children : String
    , people : String
    , videoMessage : String
    , liveVideoUrl : String
    , messageLength : Int
    , videoStage : Stage
    , paused : Bool
    , petName : String
    , image : Maybe (List Image)
    , imageId : String
    , formStatus : RemoteData
    , photoStatus : RemoteData
    , people : String
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
    | PhotosRoute
    | PersonalityRoute
    | OwnerInfoRoute
    | ThankYouRoute
    | NotFoundRoute
    | NewHomeRoute


type alias Image =
    { contents : String
    , filename : String
    }


type Msg
    = NoOp
    | UrlChange Navigation.Location
    | MakeNextClickable
    | PreparePhoto
    | TakePhoto
    | StopPhoto
    | UpdateCatsSlider String
    | UpdateChildrenSlider String
    | UpdatePeopleSlider String
    | RecordStart String
    | RecordStop String
    | RecordError String
    | ReceiveLiveVideo String
    | ReceivePhotoUrl (Result String Image)
    | ReceivePhotoUploadStatus (Result Http.Error Bool)
    | ToggleVideo Stage
    | Increment
    | UpdatePetName String
    | UploadPhotos
    | ImageSelected
    | ImageRead (Result String (List Image))
    | SubmitForm
    | ReceiveFormStatus (Result Http.Error Bool)
