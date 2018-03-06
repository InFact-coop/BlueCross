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
    , urgency = UpTo1Week
    , petName = ""
    , crossBreed = Neutral
    , primaryBreedType = Nothing
    , secondaryBreedType = Nothing
    , primaryReasonForRehoming = ""
    , secondaryReasonForRehoming = ""
    , otherReasonsForRehoming = ""
    , dogGender = Male
    , dogAge = Between0To1Year
    , medicalDetails = []
    , lastVetVisit = UpTo3Months
    , otherHealthNotes = ""
    , personalityTraits = []
    , contactMethods = []
    , fundraisingContact = []
    , otherPersonalityNotes = ""
    , cats = "50"
    , children = "50"
    , people = "50"
    , dogs = "50"
    , babies = "50"
    , otherNotes = ""
    , image = Nothing
    , supportType = []
    , ownerName = ""
    , ownerPhone = ""
    , alternativeOwnerPhone = ""
    , bestTimeToCall = AM
    , email = ""
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
    case msg of
        NoOp ->
            model ! []

        StopPhoto ->
            model ! [ stopPhoto () ]

        ReceiveLiveVideo string ->
            { model | liveVideoUrl = string } ! []

        ReceivePhotoUrl (Ok photo) ->
            { model | image = addToGallery model photo } ! []

        ReceivePhotoUrl (Err string) ->
            model ! []

        TakePhoto ->
            model ! [ takePhoto () ]

        UrlChange location ->
            { model | route = getRoute location.hash, nextClickable = False } ! [ Task.attempt (always NoOp) (toTop "container") ]

        MakeNextClickable ->
            { model | nextClickable = True } ! []

        UpdateCatsSlider value ->
            { model | cats = value } ! []

        UpdateChildrenSlider value ->
            { model | children = value } ! []

        UpdatePeopleSlider value ->
            { model | people = value } ! []

        UpdateDogsSlider value ->
            { model | dogs = value } ! []

        UpdateBabiesSlider value ->
            { model | babies = value } ! []

        UpdatePetName name ->
            { model | petName = name } ! []

        ReceiveFormStatus (Ok bool) ->
            { model | formStatus = ResponseSuccess } ! []

        ReceiveFormStatus (Err string) ->
            { model | formStatus = ResponseFailure } ! []

        ReceivePhotoUploadStatus (Ok photosResponse) ->
            { model | photoStatus = ResponseSuccess, imageUrls = addUrlsToList model photosResponse.urls } ! []

        ReceivePhotoUploadStatus (Err string) ->
            { model | photoStatus = ResponseFailure } ! []

        SubmitForm ->
            { model | formStatus = Loading } ! [ postForm model ]

        UploadPhotos ->
            { model | photoStatus = Loading, image = Nothing } ! [ uploadPhotos model ]

        ImageSelected ->
            ( model
            , fileSelected model.imageId
            )

        ImageRead (Ok listImages) ->
            { model | image = addListToGallery model listImages } ! []

        ImageRead (Err error) ->
            model ! []

        PreparePhoto ->
            model ! [ preparePhoto () ]

        UpdateUrgency timescale ->
            { model | urgency = timescale, nextClickable = True } ! []

        UpdateGender gender ->
            { model | dogGender = gender, nextClickable = True } ! []

        UpdateCrossBreed trilean ->
            { model | crossBreed = trilean } ! []

        UpdatePrimaryBreed breed ->
            { model | primaryBreedType = Just breed } ! []

        UpdateSecondaryBreed breed ->
            { model | secondaryBreedType = Just breed } ! []

        UpdatePrimaryReason string ->
            { model | primaryReasonForRehoming = string } ! []

        UpdateSecondaryReason string ->
            { model | secondaryReasonForRehoming = string } ! []

        UpdateOtherReasons string ->
            { model | otherReasonsForRehoming = string } ! []

        UpdateDogAge ageRange ->
            { model | dogAge = ageRange } ! []

        UpdateLastVetVisit timescale ->
            { model | lastVetVisit = timescale } ! []

        UpdateOtherHealth string ->
            { model | otherHealthNotes = string } ! []

        UpdateOwnerName string ->
            { model | ownerName = string } ! []

        UpdateOwnerEmail string ->
            { model | email = string } ! []

        UpdateOwnerPhone string ->
            { model | ownerPhone = string } ! []

        UpdateAlternativeOwnerPhone string ->
            { model | alternativeOwnerPhone = string } ! []

        UpdateBestTimeToCall timeOfDay ->
            { model | bestTimeToCall = timeOfDay } ! []

        UpdateOtherPersonality string ->
            { model | otherPersonalityNotes = string } ! []

        UpdateOtherGeneral string ->
            { model | otherNotes = string } ! []

        ToggleMedicalDetail string checked ->
            if checked && isNewListEntry string model.medicalDetails then
                { model | medicalDetails = model.medicalDetails ++ [ string ] } ! []
            else
                { model | medicalDetails = List.filter (\x -> x /= string) model.medicalDetails } ! []

        TogglePersonality string checked ->
            if checked && isNewListEntry string model.personalityTraits then
                { model | personalityTraits = model.personalityTraits ++ [ string ] } ! []
            else
                { model | personalityTraits = List.filter (\x -> x /= string) model.personalityTraits } ! []

        ToggleContactMethods string checked ->
            if checked && isNewListEntry string model.contactMethods then
                { model | contactMethods = model.contactMethods ++ [ string ] } ! []
            else
                { model | contactMethods = List.filter (\x -> x /= string) model.contactMethods } ! []

        ToggleFundraisingContact string checked ->
            if checked && isNewListEntry string model.fundraisingContact then
                { model | fundraisingContact = model.fundraisingContact ++ [ string ] } ! []
            else
                { model | fundraisingContact = List.filter (\x -> x /= string) model.fundraisingContact } ! []

        ToggleSupportPreference string checked ->
            if checked && isNewListEntry string model.supportType then
                { model | supportType = model.supportType ++ [ string ] } ! []
            else
                { model | supportType = List.filter (\x -> x /= string) model.supportType } ! []


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


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ liveVideoUrl ReceiveLiveVideo
        , receivePhotoUrl (decodeSingleImage >> ReceivePhotoUrl)
        , fileContentRead (decodeImageList >> ImageRead)
        ]
