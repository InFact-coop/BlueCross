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
import Transit exposing (empty, start, subscriptions, tick)
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
    , postcode = ""
    , address = ""
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
            let
                updatedModel =
                    { model | route = getRoute location.hash }
            in
            nextClickableToModel updatedModel ! [ Task.attempt (always NoOp) (toTop "container") ]

        NavigateTo location ->
            Transit.start TransitMsg (UrlChange location) ( 200, 200 ) model

        TransitMsg a ->
            Transit.tick TransitMsg a model

        MakeNextClickable ->
            { model | nextClickable = True } ! []

        UpdateCatsSlider value ->
            let
                updatedModel =
                    { model | cats = value }
            in
            nextClickableToModel updatedModel ! []

        UpdateChildrenSlider value ->
            { model | children = value } ! []

        UpdatePeopleSlider value ->
            { model | people = value } ! []

        UpdateDogsSlider value ->
            let
                updatedModel =
                    { model | dogs = value }
            in
            nextClickableToModel updatedModel ! []

        UpdateBabiesSlider value ->
            { model | babies = value } ! []

        UpdatePetName name ->
            let
                updatedModel =
                    { model | petName = name }
            in
            nextClickableToModel updatedModel ! []

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
            let
                updatedModel =
                    { model | urgency = timescale }
            in
            nextClickableToModel updatedModel ! []

        UpdateGender gender ->
            let
                updatedModel =
                    { model | dogGender = gender }
            in
            nextClickableToModel updatedModel ! []

        UpdateCrossBreed trilean ->
            let
                updatedModel =
                    { model | crossBreed = trilean }
            in
            nextClickableToModel updatedModel ! []

        UpdatePrimaryBreed breed ->
            let
                updatedModel =
                    { model | primaryBreedType = Just breed }
            in
            nextClickableToModel updatedModel ! []

        UpdateSecondaryBreed breed ->
            { model | secondaryBreedType = Just breed } ! []

        UpdatePrimaryReason string ->
            { model | primaryReasonForRehoming = string } ! []

        UpdateSecondaryReason string ->
            { model | secondaryReasonForRehoming = string } ! []

        UpdateOtherReasons string ->
            { model | otherReasonsForRehoming = string } ! []

        UpdateDogAge ageRange ->
            let
                updatedModel =
                    { model | dogAge = ageRange }
            in
            nextClickableToModel updatedModel ! []

        UpdateLastVetVisit timescale ->
            let
                updatedModel =
                    { model | lastVetVisit = timescale }
            in
            nextClickableToModel updatedModel ! []

        UpdateOtherHealth string ->
            { model | otherHealthNotes = string } ! []

        UpdateOwnerName string ->
            let
                updatedModel =
                    { model | ownerName = string }
            in
            nextClickableToModel updatedModel ! []

        UpdateOwnerEmail string ->
            let
                updatedModel =
                    { model | email = string }
            in
            nextClickableToModel updatedModel ! []

        UpdateAddress string ->
            { model | address = string } ! []

        UpdatePostcode string ->
            { model | postcode = string } ! []

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


nextClickableToModel : Model -> Model
nextClickableToModel model =
    let
        trueModel =
            { model | nextClickable = True }

        falseModel =
            { model | nextClickable = False }
    in
    case model.route of
        HomeRoute ->
            ifThenElse
                (model.urgency /= TimeScaleNotChosen)
                trueModel
                falseModel

        BeforeYouBeginRoute ->
            ifThenElse
                (model.medicalDetails /= [])
                trueModel
                falseModel

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
                trueModel
                falseModel

        PhotosRoute ->
            trueModel

        PersonalityRoute ->
            trueModel

        OwnerInfoRoute ->
            ifThenElse
                (model.ownerName
                    /= ""
                    && model.email
                    /= ""
                )
                trueModel
                falseModel

        ThankYouRoute ->
            trueModel

        NotFoundRoute ->
            trueModel

        NewHomeRoute ->
            ifThenElse
                (model.cats
                    /= "-1"
                    && model.dogs
                    /= "-1"
                )
                trueModel
                falseModel

        FindingAHomeRoute ->
            trueModel


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ liveVideoUrl ReceiveLiveVideo
        , receivePhotoUrl (decodeSingleImage >> ReceivePhotoUrl)
        , fileContentRead (decodeImageList >> ImageRead)
        , Transit.subscriptions TransitMsg model
        ]
