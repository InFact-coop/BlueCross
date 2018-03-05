module Types exposing (..)

import Http exposing (..)
import Navigation


type alias Model =
    { route : Route
    , nextClickable : Bool
    , formStatus : RemoteData
    , photoStatus : RemoteData
    , liveVideoUrl : String
    , imageId : String
    , urgency : TimeScale
    , petName : String
    , crossBreed : Trilean
    , primaryBreedType : Maybe DogBreed
    , secondaryBreedType : Maybe DogBreed
    , primaryReasonForRehoming : String
    , secondaryReasonForRehoming : String
    , otherReasonsForRehoming : String
    , dogGender : Gender
    , dogAge : AgeRange
    , medicalDetails : List String
    , lastVetVisit : VetTimeScale
    , otherHealthNotes : String
    , personalityTraits : List String
    , otherPersonalityNotes : String
    , cats : String
    , dogs : String
    , babies : String
    , children : String
    , people : String
    , otherNotes : String
    , image : Maybe (List Image)
    , imageUrls : Maybe (List String)
    , supportType : List String
    , ownerName : String
    , ownerPhone : String
    , alternativeOwnerPhone : String
    , bestTimeToCall : TimeOfDay
    , email : String
    }


type Gender
    = Male
    | Female


type TimeOfDay
    = AM
    | PM
    | NoPreference


type SupportType
    = HomeDirect
    | RehomingCentre
    | Unsure
    | DontMind


type PersonalityTraits
    = Noisy
    | Sleepy
    | Friendly
    | Shy
    | Playful
    | Cuddly
    | Nervous
    | LaidBack
    | Obedient
    | Loving
    | Energetic
    | Grumpy
    | Hungry
    | Calm
    | Excitable
    | Growler


type MedicalCheck
    = Vaccinated
    | Neutered
    | Microchipped
    | Unknown


type VetTimeScale
    = UpTo3Months
    | Between3To12Months
    | OverAYear
    | UnknownSlashNever


type Trilean
    = Yes
    | No
    | Neutral


type AgeRange
    = Between0To1Year
    | Between2To5Years
    | Between6To10Years
    | Over10Years


type TimeScale
    = UpTo1Week
    | UpTo3Weeks
    | UpTo2Months
    | Over2Months
    | NoTimeScale


type DogBreed
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


type alias PhotosResponse =
    { finalSuccess : Bool
    , urls : List String
    }


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
    | ReceiveLiveVideo String
    | ReceivePhotoUrl (Result String Image)
    | ReceivePhotoUploadStatus (Result Http.Error PhotosResponse)
    | UpdatePetName String
    | UpdateDogAge AgeRange
    | UpdatePrimaryBreed DogBreed
    | UpdateLastVetVisit VetTimeScale
    | TogglePersonality String Bool
    | UpdateSecondaryBreed DogBreed
    | UpdateUrgency TimeScale
    | UpdateOtherHealth String
    | UpdateGender Gender
    | UpdateCrossBreed Trilean
    | UpdateOtherPersonality String
    | UpdatePrimaryReason String
    | UpdateSecondaryReason String
    | UpdateOwnerName String
    | UpdateOwnerPhone String
    | UpdateAlternativeOwnerPhone String
    | UpdateBestTimeToCall TimeOfDay
    | UpdateOwnerEmail String
    | ToggleMedicalDetail String Bool
    | ToggleSupportPreference String Bool
    | UpdateOtherReasons String
    | UpdateOtherGeneral String
    | UploadPhotos
    | ImageSelected
    | ImageRead (Result String (List Image))
    | SubmitForm
    | ReceiveFormStatus (Result Http.Error Bool)
