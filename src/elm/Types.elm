module Types exposing (..)

import Http exposing (..)
import Navigation


type alias Model =
    { route : Route
    , nextClickable : Bool
    , cats : String
    , children : String
    , people : String
    , dogs : String
    , babies : String
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
    | PhotosRoute
    | PersonalityRoute
    | OwnerInfoRoute
    | ThankYouRoute
    | NotFoundRoute
    | NewHomeRoute
    | FindingAHomeRoute


type DogBreeds
    = Akita
    | AlaskanMalamute
    | AmericanBullDog
    | AustralianKelpie
    | BassetHound
    | Beagle
    | BeardedCollie
    | BedlingtonTerrier
    | BelgianShepherdMalinois
    | BelgianShepherdDogGroenendael
    | BerneseMountainDog
    | BichonFrise
    | BorderCollie
    | BorderTerrier
    | BostonTerrier
    | Boxer
    | BullMastiff
    | Bulldog
    | CairnTerrier
    | CavalierKingCharlesSpaniel
    | ChihuahuaLongCoat
    | ChihuahuaSmoothCoat
    | ChineseCrested
    | ChowChow
    | CockerSpaniel
    | Corgi
    | DachshundLongHaired
    | DachshundMiniatureLongHaired
    | DachshundMiniatureSmoothHaired
    | DachshundMiniatureWireHaired
    | DachshundSmoothHaired
    | DachshundWireHaired
    | Dalmatian
    | Doberman
    | DoguedeBordeaux
    | EnglishBullTerrier
    | EnglishSetter
    | EnglishSpringerSpaniel
    | EnglishToyTerrier
    | FlatCoatedRetriever
    | FoxTerrier
    | Foxhound
    | FrenchBulldog
    | GermanLonghairedPointer
    | GermanShepherdDog
    | GermanShortHairedPointer
    | GoldenRetriever
    | GreatDane
    | Greyhound
    | GriffonBruxellois
    | Harrier
    | Havanese
    | IrishSetter
    | ItalianGreyhound
    | JackRussellTerrier
    | JapaneseSpitz
    | KingCharlesSpaniel
    | LabradorRetriever
    | LakelandTerrier
    | Leonberger
    | LhasaApso
    | Lurcher
    | Maltese
    | Mastiff
    | MiniaturePinscher
    | MiniaturePoodle
    | MiniatureSchnauzer
    | MongrelLarge
    | MongrelMedium
    | MongrelSmall
    | NorfolkTerrier
    | NovaScotiaDuckTollingRetriever
    | NULL
    | OldEnglishSheepdog
    | Papillon
    | ParsonsJackRussellTerrier
    | PatterdaleTerrier
    | Pointer
    | Pomeranian
    | PortuguesePodengo
    | Pug
    | PyreneanMountainDog
    | RhodesianRidgeback
    | Rottweiler
    | RussianBlackTerrier
    | SaintBernard
    | Saluki
    | ScottishTerrier
    | SharPei
    | ShetlandSheepdogSheltie
    | ShihTzu
    | SiberianHusky
    | StaffordshireBullTerrier
    | StandardPoodle
    | StandardSchnauzer
    | TibetanTerrier
    | ToyPoodle
    | TreeWalkerCoonhound
    | Weimaraner
    | WelshSpringerSpaniel
    | WestHighlandWhiteTerrier
    | Whippet
    | YorkshireTerrier


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
    | UpdateDogsSlider String
    | UpdateBabiesSlider String
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
