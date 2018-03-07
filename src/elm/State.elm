port module State exposing (..)

import Data.Photos exposing (decodeImageList, decodeSingleImage, imageDecoder)
import Dom.Scroll exposing (..)
import Helpers exposing (..)
import Json.Decode
import Navigation exposing (..)
import Requests.PostForm exposing (postForm)
import Requests.UploadPhotos exposing (uploadPhotos)
import Router exposing (getRoute, viewFromUrl)
import Task
import Transit exposing (start, tick, subscriptions, empty)
import Types exposing (..)


initModel : Model
initModel =
    { route = HomeRoute
    , nextClickable = False
    , formStatus = NotAsked
    , photoStatus = NotAsked
    , liveVideoUrl = ""
    , imageId = "imageUpload"
    , imageUrls = Nothing
    , urgency = TimeScaleNotChosen
    , petName = ""
    , crossBreed = TrileanNotChosen
    , primaryBreedType = Nothing
    , secondaryBreedType = Nothing
    , primaryReasonForRehoming = ""
    , secondaryReasonForRehoming = ""
    , otherReasonsForRehoming = ""
    , dogGender = Male
    , dogAge = AgeNotChosen
    , medicalDetails = []
    , lastVetVisit = VetTimeScaleNotChosen
    , otherHealthNotes = ""
    , personalityTraits = []
    , contactMethods = []
    , fundraisingContact = []
    , otherPersonalityNotes = ""
    , cats = "-1"
    , children = "-1"
    , people = "-1"
    , dogs = "-1"
    , babies = "-1"
    , otherNotes = ""
    , image = Nothing
    , supportType = []
    , ownerName = ""
    , ownerPhone = ""
    , alternativeOwnerPhone = ""
    , bestTimeToCall = AM
    , email = ""
    , transition = Transit.empty
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        model =
            viewFromUrl location initModel
    in
        model ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        modelCanProgress =
            { model | nextClickable = nextClickableToBool model }
    in
        case msg of
            NoOp ->
                modelCanProgress ! []

            StopPhoto ->
                modelCanProgress ! [ stopPhoto () ]

            ReceiveLiveVideo string ->
                { modelCanProgress | liveVideoUrl = string } ! []

            ReceivePhotoUrl (Ok photo) ->
                { modelCanProgress | image = addToGallery model photo } ! []

            ReceivePhotoUrl (Err string) ->
                modelCanProgress ! []

            TakePhoto ->
                modelCanProgress ! [ takePhoto () ]

            UrlChange location ->
                { modelCanProgress | route = getRoute location.hash, nextClickable = False } ! [ Task.attempt (always NoOp) (toTop "container") ]

            NavigateTo location ->
                Transit.start TransitMsg (UrlChange location) ( 200, 200 ) model

            TransitMsg a ->
                Transit.tick TransitMsg a model

            MakeNextClickable ->
                { modelCanProgress | nextClickable = True } ! []

            UpdateCatsSlider value ->
                { modelCanProgress | cats = value } ! []

            UpdateChildrenSlider value ->
                { modelCanProgress | children = value } ! []

            UpdatePeopleSlider value ->
                { modelCanProgress | people = value } ! []

            UpdateDogsSlider value ->
                { modelCanProgress | dogs = value } ! []

            UpdateBabiesSlider value ->
                { modelCanProgress | babies = value } ! []

            UpdatePetName name ->
                { modelCanProgress | petName = name } ! []

            ReceiveFormStatus (Ok bool) ->
                { modelCanProgress | formStatus = ResponseSuccess } ! []

            ReceiveFormStatus (Err string) ->
                { modelCanProgress | formStatus = ResponseFailure } ! []

            ReceivePhotoUploadStatus (Ok photosResponse) ->
                { modelCanProgress | photoStatus = ResponseSuccess, imageUrls = addUrlsToList model photosResponse.urls } ! []

            ReceivePhotoUploadStatus (Err string) ->
                { modelCanProgress | photoStatus = ResponseFailure } ! []

            SubmitForm ->
                { modelCanProgress | formStatus = Loading } ! [ postForm model ]

            UploadPhotos ->
                { modelCanProgress | photoStatus = Loading, image = Nothing } ! [ uploadPhotos model ]

            ImageSelected ->
                ( modelCanProgress
                , fileSelected model.imageId
                )

            ImageRead (Ok listImages) ->
                { modelCanProgress | image = addListToGallery model listImages } ! []

            ImageRead (Err error) ->
                modelCanProgress ! []

            PreparePhoto ->
                modelCanProgress ! [ preparePhoto () ]

            UpdateUrgency timescale ->
                { modelCanProgress | urgency = timescale, nextClickable = True } ! []

            UpdateGender gender ->
                { modelCanProgress | dogGender = gender, nextClickable = True } ! []

            UpdateCrossBreed trilean ->
                { modelCanProgress | crossBreed = trilean } ! []

            UpdatePrimaryBreed breed ->
                { modelCanProgress | primaryBreedType = Just breed } ! []

            UpdateSecondaryBreed breed ->
                { modelCanProgress | secondaryBreedType = Just breed } ! []

            UpdatePrimaryReason string ->
                { modelCanProgress | primaryReasonForRehoming = string } ! []

            UpdateSecondaryReason string ->
                { modelCanProgress | secondaryReasonForRehoming = string } ! []

            UpdateOtherReasons string ->
                { modelCanProgress | otherReasonsForRehoming = string } ! []

            UpdateDogAge ageRange ->
                { modelCanProgress | dogAge = ageRange } ! []

            UpdateLastVetVisit timescale ->
                { modelCanProgress | lastVetVisit = timescale } ! []

            UpdateOtherHealth string ->
                { modelCanProgress | otherHealthNotes = string } ! []

            UpdateOwnerName string ->
                { modelCanProgress | ownerName = string } ! []

            UpdateOwnerEmail string ->
                { modelCanProgress | email = string } ! []

            UpdateOwnerPhone string ->
                { modelCanProgress | ownerPhone = string } ! []

            UpdateAlternativeOwnerPhone string ->
                { modelCanProgress | alternativeOwnerPhone = string } ! []

            UpdateBestTimeToCall timeOfDay ->
                { modelCanProgress | bestTimeToCall = timeOfDay } ! []

            UpdateOtherPersonality string ->
                { modelCanProgress | otherPersonalityNotes = string } ! []

            UpdateOtherGeneral string ->
                { modelCanProgress | otherNotes = string } ! []

            ToggleMedicalDetail string checked ->
                if checked && isNewListEntry string model.medicalDetails then
                    { modelCanProgress | medicalDetails = model.medicalDetails ++ [ string ] } ! []
                else
                    { modelCanProgress | medicalDetails = List.filter (\x -> x /= string) model.medicalDetails } ! []

            TogglePersonality string checked ->
                if checked && isNewListEntry string model.personalityTraits then
                    { modelCanProgress | personalityTraits = model.personalityTraits ++ [ string ] } ! []
                else
                    { modelCanProgress | personalityTraits = List.filter (\x -> x /= string) model.personalityTraits } ! []

            ToggleContactMethods string checked ->
                if checked && isNewListEntry string model.contactMethods then
                    { modelCanProgress | contactMethods = model.contactMethods ++ [ string ] } ! []
                else
                    { modelCanProgress | contactMethods = List.filter (\x -> x /= string) model.contactMethods } ! []

            ToggleFundraisingContact string checked ->
                if checked && isNewListEntry string model.fundraisingContact then
                    { modelCanProgress | fundraisingContact = model.fundraisingContact ++ [ string ] } ! []
                else
                    { modelCanProgress | fundraisingContact = List.filter (\x -> x /= string) model.fundraisingContact } ! []

            ToggleSupportPreference string checked ->
                if checked && isNewListEntry string model.supportType then
                    { modelCanProgress | supportType = model.supportType ++ [ string ] } ! []
                else
                    { modelCanProgress | supportType = List.filter (\x -> x /= string) model.supportType } ! []


port recordStart : String -> Cmd msg


port preparePhoto : () -> Cmd msg


port takePhoto : () -> Cmd msg


port stopPhoto : () -> Cmd msg


port recordStop : String -> Cmd msg


port recordError : (String -> msg) -> Sub msg


port liveVideoUrl : (String -> msg) -> Sub msg


port receivePhotoUrl : (Json.Decode.Value -> msg) -> Sub msg


port fileSelected : String -> Cmd msg


port fileContentRead : (Json.Decode.Value -> msg) -> Sub msg


addToGallery : Model -> Image -> Maybe (List Image)
addToGallery model newImage =
    case model.image of
        Just imageList ->
            Just <| imageList ++ [ newImage ]

        Nothing ->
            Just [ newImage ]


addListToGallery : Model -> List Image -> Maybe (List Image)
addListToGallery model listImages =
    case model.image of
        Just imageList ->
            Just <| imageList ++ listImages

        Nothing ->
            Just listImages


addUrlsToList : Model -> List String -> Maybe (List String)
addUrlsToList model newList =
    case model.imageUrls of
        Just oldList ->
            Just <| oldList ++ newList

        Nothing ->
            Just newList


nextClickableToBool : Model -> Bool
nextClickableToBool model =
    case model.route of
        HomeRoute ->
            ifThenElse
                (model.urgency /= TimeScaleNotChosen)
                True
                False

        BeforeYouBeginRoute ->
            ifThenElse
                (model.medicalDetails /= [])
                True
                False

        PetInfoRoute ->
            ifThenElse
                (model.petName
                    /= ""
                    && model.crossBreed
                    /= TrileanNotChosen
                    && model.primaryBreedType
                    /= Nothing
                    && model.dogGender
                    /= GenderNotChosen
                    && model.dogAge
                    /= AgeNotChosen
                )
                True
                False

        PhotosRoute ->
            True

        PersonalityRoute ->
            True

        OwnerInfoRoute ->
            ifThenElse
                (model.ownerName
                    /= ""
                    && model.email
                    /= ""
                )
                True
                False

        ThankYouRoute ->
            True

        NotFoundRoute ->
            True

        NewHomeRoute ->
            ifThenElse
                (model.cats
                    /= "-1"
                    && model.dogs
                    /= "-1"
                )
                True
                False

        FindingAHomeRoute ->
            True


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ liveVideoUrl ReceiveLiveVideo
        , receivePhotoUrl (decodeSingleImage >> ReceivePhotoUrl)
        , fileContentRead (decodeImageList >> ImageRead)
        , Transit.subscriptions TransitMsg model
        ]
