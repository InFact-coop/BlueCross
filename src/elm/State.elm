port module State exposing (..)

import Data.DogBreeds exposing (..)
import Data.Photos exposing (decodeImageList, decodeSingleImage, imageDecoder)
import Dom.Scroll exposing (..)
import Json.Decode
import Navigation exposing (..)
import Requests.PostForm exposing (postForm)
import Requests.UploadPhotos exposing (uploadPhotos)
import Router exposing (getRoute, viewFromUrl)
import Task
import Time exposing (Time, second)
import Types exposing (..)


initModel : Model
initModel =
    { route = HomeRoute
    , nextClickable = False
    , cats = "50"
    , children = "50"
    , people = "50"
    , dogs = "50"
    , babies = "50"
    , videoMessage = ""
    , liveVideoUrl = ""
    , messageLength = 0
    , videoStage = Stage0
    , paused = True
    , petName = ""
    , image = Nothing
    , formStatus = NotAsked
    , photoStatus = NotAsked
    , imageId = "imageUpload"
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

        Increment ->
            if model.messageLength >= 30 then
                model
                    |> update (ToggleVideo Stage1)
            else
                { model | messageLength = model.messageLength + 1 } ! []

        RecordStart string ->
            ( model, recordStart string )

        StopPhoto ->
            model ! [ stopPhoto () ]

        RecordStop string ->
            ( model, recordStop string )

        ReceiveLiveVideo string ->
            { model | liveVideoUrl = string } ! []

        ReceivePhotoUrl (Ok photo) ->
            { model | image = addToGallery model photo } ! []

        ReceivePhotoUrl (Err string) ->
            model ! []

        RecordError err ->
            { model | videoStage = StageErr } ! []

        TakePhoto ->
            model ! [ takePhoto () ]

        ToggleVideo stage ->
            case stage of
                StageErr ->
                    { model | videoStage = StageErr } ! []

                Stage2 ->
                    { model | videoStage = Stage0 } ! []

                Stage1 ->
                    { model | videoStage = Stage2, nextClickable = True } ! [ recordStop "yes" ]

                Stage0 ->
                    { model | videoStage = Stage1 } ! [ recordStart "yes" ]

        UrlChange location ->
            { model | route = getRoute location.hash, nextClickable = False, videoStage = Stage0, videoMessage = "" } ! [ Task.attempt (always NoOp) (toTop "container") ]

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

        ReceivePhotoUploadStatus (Ok bool) ->
            { model | photoStatus = ResponseSuccess } ! []

        ReceivePhotoUploadStatus (Err string) ->
            { model | photoStatus = ResponseFailure } ! []

        SubmitForm ->
            { model | formStatus = Loading } ! [ postForm model ]

        UploadPhotos ->
            { model | photoStatus = Loading } ! [ uploadPhotos model ]

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


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ liveVideoUrl ReceiveLiveVideo
        , receivePhotoUrl (decodeSingleImage >> ReceivePhotoUrl)
        , recordError RecordError
        , fileContentRead (decodeImageList >> ImageRead)
        , if not model.paused then
            Time.every second (always Increment)
          else
            Sub.none
        ]


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
