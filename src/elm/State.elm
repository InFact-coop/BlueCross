port module State exposing (..)

import Data.Photos exposing (decodeImageList, decodeSingleImage, imageDecoder)
import Dom exposing (focus)
import Dom.Scroll exposing (..)
import Helpers exposing (..)
import Json.Decode
import Navigation exposing (..)
import Requests.PostForm exposing (postForm)
import Requests.Postcode exposing (validatePostcode)
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
    , petType = PetTypeNotChosen
    , crossBreed = TrileanNotChosen
    , primaryDogBreedType = Nothing
    , secondaryDogBreedType = Nothing
    , primaryCatBreedType = Nothing
    , secondaryCatBreedType = Nothing
    , primaryReasonForRehoming = ""
    , secondaryReasonForRehoming = ""
    , otherReasonsForRehoming = ""
    , unknownBreed = ""
    , gender = GenderNotChosen
    , age = AgeNotChosen
    , medicalDetails = []
    , lastVetVisit = VetTimeScaleNotChosen
    , otherHealthNotes = ""
    , personalityTraits = []
    , fundraisingContact = []
    , otherPersonalityNotes = ""
    , cats = ""
    , children = ""
    , people = ""
    , dogs = ""
    , babies = ""
    , otherNotes = ""
    , image = Nothing
    , supportType = ""
    , ownerName = ""
    , ownerPhone = ""
    , alternativeOwnerPhone = ""
    , bestTimeToCall = AM
    , email = ""
    , emailIsValid = Nothing
    , postcode = ""
    , postCodeIsValid = Nothing
    , address = ""
    , transition = Transit.empty
    , isIE = False
    , cameraSupported = False
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        model =
            viewFromUrl location initModel
    in
    model ! [ checkIE (), checkCameraSupported (), Task.attempt (always NoOp) (focus "container") ]


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
            nextClickableToModel updatedModel ! [ Task.attempt (always NoOp) (toTop "container"), Task.attempt (always NoOp) (focus "container") ]

        NavigateTo location ->
            Transit.start TransitMsg (UrlChange location) ( 200, 200 ) model

        TransitMsg a ->
            Transit.tick TransitMsg a model

        MakeNextClickable ->
            { model | nextClickable = True } ! []

        UpdateCats string ->
            let
                updatedModel =
                    { model | cats = string }
            in
            nextClickableToModel updatedModel ! []

        UpdateChildren string ->
            { model | children = string } ! []

        UpdatePeople string ->
            { model | people = string } ! []

        UpdateDogs string ->
            let
                updatedModel =
                    { model | dogs = string }
            in
            nextClickableToModel updatedModel ! []

        UpdateBabies string ->
            { model | babies = string } ! []

        UpdatePetType petType ->
            { model | petType = petType } ! []

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
                    { model | gender = gender }
            in
            nextClickableToModel updatedModel ! []

        UpdateCrossBreed trilean ->
            let
                updatedModel =
                    { model | crossBreed = trilean }
            in
            nextClickableToModel updatedModel ! []

        UpdatePrimaryDogBreed breed ->
            let
                updatedModel =
                    { model | primaryDogBreedType = Just breed }
            in
            nextClickableToModel updatedModel ! []

        UpdateSecondaryDogBreed breed ->
            { model | secondaryDogBreedType = Just breed } ! []

        UpdatePrimaryCatBreed breed ->
            let
                updatedModel =
                    { model | primaryCatBreedType = Just breed }
            in
            nextClickableToModel updatedModel ! []

        UpdateSecondaryCatBreed breed ->
            { model | secondaryCatBreedType = Just breed } ! []

        UpdateUnknownBreed string ->
            { model | unknownBreed = string } ! []

        UpdatePrimaryReason string ->
            { model | primaryReasonForRehoming = string } ! []

        UpdateSecondaryReason string ->
            { model | secondaryReasonForRehoming = string } ! []

        UpdateOtherReasons string ->
            { model | otherReasonsForRehoming = string } ! []

        UpdateAge ageRange ->
            let
                updatedModel =
                    { model | age = ageRange }
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
                    { model | email = string, emailIsValid = checkEmail string }
            in
            nextClickableToModel updatedModel ! []

        UpdateAddress string ->
            { model | address = string } ! []

        UpdatePostcode string ->
            let
                sanitisedPostcode =
                    sanitisePostCode string
            in
            { model | postcode = sanitisedPostcode } ! [ validatePostcode <| ifThenElse (sanitisedPostcode /= "") sanitisedPostcode " " ]

        DeleteImage im ->
            case model.image of
                Nothing ->
                    model ! []

                Just listImages ->
                    { model | image = Just <| List.filter (\current -> current /= im) listImages } ! []

        UpdateOwnerPhone string ->
            let
                updatedModel =
                    { model | ownerPhone = sanitisePhoneNumber string }
            in
            nextClickableToModel updatedModel ! []

        UpdateAlternativeOwnerPhone string ->
            let
                updatedModel =
                    { model | alternativeOwnerPhone = sanitisePhoneNumber string }
            in
            nextClickableToModel updatedModel ! []

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

        ToggleRehomingCentreSupport ->
            { model | supportType = "Rehoming Centre" } ! []

        ToggleHomeDirectSupport ->
            { model | supportType = "Home Direct" } ! []

        ToggleUnsureSupport ->
            { model | supportType = "Unsure" } ! []

        ReceiveIsIE bool ->
            { model | isIE = bool } ! []

        ReceivePostcodeValidity (Ok bool) ->
            let
                updatedModel =
                    { model | postCodeIsValid = Just bool }
            in
            nextClickableToModel updatedModel ! []

        ReceivePostcodeValidity (Err string) ->
            model ! []

        ReceiveCameraSupported bool ->
            { model | cameraSupported = bool } ! []


port recordStart : String -> Cmd msg


port preparePhoto : () -> Cmd msg


port checkIE : () -> Cmd msg


port checkCameraSupported : () -> Cmd msg


port isIE : (Bool -> msg) -> Sub msg


port cameraSupported : (Bool -> msg) -> Sub msg


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
                (model.urgency
                    /= TimeScaleNotChosen
                    && model.petType
                    /= PetTypeNotChosen
                )
                trueModel
                falseModel

        HealthRoute ->
            ifThenElse
                (model.lastVetVisit /= VetTimeScaleNotChosen)
                trueModel
                falseModel

        PetInfoRoute ->
            ifThenElse
                (model.petName
                    /= ""
                    && model.crossBreed
                    /= TrileanNotChosen
                    && ifThenElse
                        (model.crossBreed
                            == Neutral
                        )
                        True
                        (model.petType
                            == Dog
                            && model.primaryDogBreedType
                            /= Nothing
                            || model.petType
                            == Cat
                            && model.primaryCatBreedType
                            /= Nothing
                        )
                    && model.gender
                    /= GenderNotChosen
                    && model.age
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
                    && model.ownerPhone
                    /= ""
                    && model.emailIsValid
                    == Just True
                    && model.postCodeIsValid
                    == Just True
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
                    /= ""
                    && model.dogs
                    /= ""
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
        , isIE ReceiveIsIE
        , cameraSupported ReceiveCameraSupported
        ]
