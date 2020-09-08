module Types exposing (..)

import Http exposing (..)
import Navigation
import Transit


type alias Model =
    Transit.WithTransition
        { route : Route
        , nextClickable : Bool
        , formStatus : RemoteData
        , photoStatus : RemoteData
        , liveVideoUrl : String
        , imageId : String
        , urgency : TimeScale
        , petType : PetType
        , petName : String
        , crossBreed : Trilean
        , primaryDogBreedType : Maybe DogBreed
        , secondaryDogBreedType : Maybe DogBreed
        , primaryCatBreedType : Maybe CatBreed
        , secondaryCatBreedType : Maybe CatBreed
        , primaryReasonForRehoming : String
        , secondaryReasonForRehoming : String
        , otherReasonsForRehoming : String
        , unknownBreed : String
        , gender : Gender
        , age : AgeRange
        , fundraisingContact : List String
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
        , supportType : String
        , ownerName : String
        , ownerPhone : String
        , alternativeOwnerPhone : String
        , bestTimeToCall : TimeOfDay
        , email : String
        , emailIsValid : Maybe Bool
        , address : String
        , postcode : String
        , postCodeIsValid : Maybe Bool
        , isIE : Bool
        , cameraSupported : Bool
        }


type PetType
    = Dog
    | Cat
    | PetTypeNotChosen


type Gender
    = Male
    | Female
    | GenderNotChosen


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
    = Playful
    | Cuddly
    | Nervous
    | LaidBack
    | Loving
    | Energetic


type DogPersonalityTraits
    = Sociable
    | Friendly
    | Calm
    | Excitable
    | Boisterous


type CatPersonalityTraits
    = LapCat
    | Skittish


type MedicalCheck
    = Vaccinated
    | Neutered
    | Microchipped
    | Unknown
    | MedicalCheckNotChosen


type VetTimeScale
    = UpTo3Months
    | Between3To12Months
    | OverAYear
    | UnknownSlashNever
    | VetTimeScaleNotChosen


type Trilean
    = Yes
    | No
    | Neutral
    | TrileanNotChosen


type AgeRange
    = Between0To1Year
    | Between2To5Years
    | Between6To10Years
    | Over10Years
    | AgeNotChosen


type TimeScale
    = UpTo1Week
    | UpTo3Weeks
    | UpTo2Months
    | Over2Months
    | TimeScaleNotChosen


type DogBreed
    = Affenpinscher
    | AfghanHound
    | AiredaleTerrier
    | Akita
    | AlaskanMalamute
    | AmericanBullDog
    | AmericanCockerSpaniel
    | AmericanWaterSpaniel
    | AnatolianShepherdDog
    | AustralianCattleDog
    | AustralianKelpie
    | AustralianShepherd
    | AustralianSilkyTerrier
    | AustralianTerrier
    | Basenji
    | BassetBleudeGascogne
    | BassetFauvedeBretagne
    | BassetGriffonVendeenGrand
    | BassetGriffonVendeenPetit
    | BassetHound
    | BavarianMountainHound
    | Beagle
    | BeardedCollie
    | Beauceron
    | BedlingtonTerrier
    | BelgianShepherd
    | BelgianShepherdDog
    | BelgianShepherdDogGroenendael
    | BelgianShepherdMalinois
    | Bergamasco
    | BerneseMountainDog
    | BichonFrise
    | Bloodhound
    | Bolognese
    | BorderCollie
    | BorderTerrier
    | Borzoi
    | BostonTerrier
    | BouvierDesFlandres
    | Boxer
    | BraccoItaliano
    | Briard
    | Brittany
    | BullMastiff
    | Bulldog
    | CairnTerrier
    | CanaanDog
    | CanadianEskimoDog
    | CavalierKingCharlesSpaniel
    | CeskyTerrier
    | ChesapeakeBayRetriever
    | Chihuahua
    | ChihuahuaLongCoat
    | ChihuahuaSmoothCoat
    | ChineseCrested
    | ChowChow
    | ClumberSpaniel
    | CockerSpaniel
    | Corgi
    | Cotondetulear
    | CurlyCoatedRetriever
    | Dachshund
    | DachshundLongHaired
    | DachshundMiniatureLongHaired
    | DachshundMiniatureSmoothHaired
    | DachshundMiniatureWireHaired
    | DachshundSmoothHaired
    | DachshundWireHaired
    | Dalmatian
    | DandieDinmontTerrier
    | DeerHound
    | Doberman
    | DogBreedNotChosen
    | DoguedeBordeaux
    | EnglishBullTerrier
    | EnglishBullTerrierMiniature
    | EnglishSetter
    | EnglishSpringerSpaniel
    | EnglishToyTerrier
    | EstreleaMountainDog
    | FellTerrier
    | FieldSpaniel
    | FinnishLapphund
    | FinnishSpitz
    | FlatCoatedRetriever
    | FoxTerrier
    | Foxhound
    | FrenchBulldog
    | GermanLonghairedPointer
    | GermanPinscher
    | GermanShepherdDog
    | GermanShortHairedPointer
    | GermanSpitz
    | GermanWirehairedPointer
    | GiantSchnauzer
    | GlenofImaalTerrier
    | GoldenRetriever
    | GordonSetter
    | GrandBleuDeGascoigne
    | GreatDane
    | Greyhound
    | GriffonBruxellois
    | Hamiltonstovare
    | Harrier
    | Havanese
    | Hovawart
    | HungarianKuvasz
    | HungarianPuli
    | HungarianVizsla
    | IbizanHound
    | IrishRedAndWhiteSetter
    | IrishSetter
    | IrishTerrier
    | IrishWaterSpaniel
    | IrishWolfhound
    | ItalianGreyhound
    | ItalianSpinone
    | JackRussellTerrier
    | JapaneseChin
    | JapaneseSpitz
    | Keeshound
    | KerryBlueTerrier
    | KingCharlesSpaniel
    | Komondor
    | Kooikerhondje
    | LabradorRetriever
    | LakelandTerrier
    | LancashireHeeler
    | LargeMunsterlander
    | Leonberger
    | LhasaApso
    | LongCoat
    | Lowchen
    | Lurcher
    | Malinois
    | Maltese
    | ManchesterTerrier
    | MaremmaSheepdog
    | Mastiff
    | MexicanHairless
    | MiniatureBullTerrier
    | MiniatureLongHaired
    | MiniaturePinscher
    | MiniaturePoodle
    | MiniatureSchnauzer
    | MiniatureSmoothHaired
    | MiniatureWireHaired
    | MongrelLarge
    | MongrelMedium
    | MongrelSmall
    | NeapolitanMastiff
    | NewZealandHuntaway
    | Newfoundland
    | NorfolkTerrier
    | NorthernInuit
    | NorwegianBuhund
    | NorwegianElkhound
    | NorwichTerrier
    | NovaScotiaDuckTollingRetriever
    | OldEnglishSheepdog
    | Otterhound
    | Papillon
    | ParsonsJackRussellTerrier
    | PatterdaleTerrier
    | Pekingese
    | PharaohHound
    | Pointer
    | PolishLowlandSheepdog
    | Pomeranian
    | PortuguesePodengo
    | PortugueseWaterDog
    | Pug
    | PyreneanMountainDog
    | PyreneanSheepdog
    | RhodesianRidgeback
    | Rottweiler
    | RoughCollie
    | RussianBlackTerrier
    | SaintBernard
    | Saluki
    | Samoyed
    | Schipperke
    | ScottishTerrier
    | SealyhamTerrier
    | SegugioItaliano
    | SharPei
    | Sheltie
    | ShetlandSheepdog
    | ShetlandSheepdogSheltie
    | ShibaInu
    | ShihTzu
    | SiberianHusky
    | SkyeTerrier
    | Sloughi
    | SmallMunsterlander
    | SmoothCollie
    | SoftCoatedWheatenTerrier
    | SpanishWaterHound
    | StaffordshireBullTerrier
    | StandardPoodle
    | StandardSchnauzer
    | SussexSpaniel
    | SwedishLapphund
    | SwedishVallhund
    | TibetanMastiff
    | TibetanSpaniel
    | TibetanTerrier
    | ToyPoodle
    | TreeWalkerCoonhound
    | Utonagon
    | Weimaraner
    | WelshSpringerSpaniel
    | WelshTerrier
    | WestHighlandWhiteTerrier
    | Whippet
    | YorkshireTerrier


type CatBreed
    = Abyssinian
    | AmericanCurl
    | Angora
    | Balinese
    | Bengal
    | Birman
    | Bombay
    | BritishBlue
    | BritishLonghair
    | BritishShorthair
    | BritishTip
    | Burmese
    | Burmilla
    | CatBreedNotChosen
    | Chinchilla
    | Colourpoint
    | CornishRex
    | Crossbreed
    | DevonRex
    | DomesticLonghair
    | DomesticSemiLonghair
    | DomesticShorthair
    | EgyptianMau
    | Exotic
    | ExoticShortHair
    | Havana
    | Korat
    | MaineCoon
    | Manx
    | NorwegianForestCat
    | Ocicat
    | Oriental
    | OrientalShortHair
    | Persian
    | Ragdoll
    | RussianBlue
    | Savannah
    | ScottishFold
    | SelkirkRex
    | Siamese
    | Singapura
    | Snowshoe
    | Somali
    | Sphynx
    | Tonkinese
    | TurkishAngora
    | TurkishVan


type Stage
    = Stage0
    | Stage1
    | Stage2
    | StageErr


type FundraisingContact
    = Phone
    | Email
    | Text


type RemoteData
    = NotAsked
    | Loading
    | ResponseFailure
    | ResponseSuccess


type Route
    = HomeRoute
    | HealthRoute
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
    | DeleteImage Image
    | TakePhoto
    | StopPhoto
    | UpdatePeople String
    | UpdateCats String
    | UpdateChildren String
    | UpdateDogs String
    | UpdateBabies String
    | ReceiveLiveVideo String
    | ReceivePhotoUrl (Result String Image)
    | ReceivePhotoUploadStatus (Result Http.Error PhotosResponse)
    | UpdatePetType PetType
    | UpdatePetName String
    | UpdateAge AgeRange
    | UpdatePrimaryDogBreed DogBreed
    | UpdatePrimaryCatBreed CatBreed
    | UpdateLastVetVisit VetTimeScale
    | TogglePersonality String Bool
    | ToggleFundraisingContact String Bool
    | UpdateSecondaryDogBreed DogBreed
    | UpdateSecondaryCatBreed CatBreed
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
    | UpdateAddress String
    | UpdatePostcode String
    | ToggleMedicalDetail String Bool
    | ToggleRehomingCentreSupport
    | ToggleHomeDirectSupport
    | ToggleUnsureSupport
    | TransitMsg (Transit.Msg Msg)
    | NavigateTo Navigation.Location
    | UpdateOtherReasons String
    | UpdateOtherGeneral String
    | UpdateUnknownBreed String
    | UploadPhotos
    | ImageSelected
    | ImageRead (Result String (List Image))
    | SubmitForm
    | ReceiveFormStatus (Result Http.Error Bool)
    | ReceivePostcodeValidity (Result Http.Error Bool)
    | ReceiveIsIE Bool
    | ReceiveCameraSupported Bool
