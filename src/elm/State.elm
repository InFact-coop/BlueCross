port module State exposing (..)

import Data.Photos exposing (decodeImageList, imageListDecoder)
import Dom.Scroll exposing (..)
import Json.Decode
import Navigation exposing (..)
import Router exposing (getRoute, viewFromUrl)
import Task
import Time exposing (Time, second)
import Types exposing (..)


initModel : Model
initModel =
    { route = HomeRoute
    , nextClickable = False
    , sliderValues =
        { cats = "50"
        , children = "50"
        , people = "50"
        }
    , videoMessage = ""
    , messageLength = 0
    , videoStage = Stage0
    , paused = True
    , petName = ""
    , image = Nothing
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
                ( { model | messageLength = model.messageLength + 1 }, Cmd.none )

        RecordStart string ->
            ( model, recordStart string )

        RecordStop string ->
            ( model, recordStop string )

        RecieveVideo string ->
            ( { model | videoMessage = string }, Cmd.none )

        RecordError err ->
            ( { model | videoStage = StageErr }, Cmd.none )

        ToggleVideo stage ->
            case stage of
                StageErr ->
                    ( { model | videoStage = StageErr }, Cmd.none )

                Stage2 ->
                    ( { model | videoStage = Stage0 }, Cmd.none )

                Stage1 ->
                    ( { model | videoStage = Stage2, nextClickable = True }, recordStop "yes" )

                Stage0 ->
                    ( { model | videoStage = Stage1 }, recordStart "yes" )

        UrlChange location ->
            { model | route = getRoute location.hash, nextClickable = False, videoStage = Stage0, videoMessage = "" } ! [ Task.attempt (always NoOp) (toTop "container") ]

        MakeNextClickable ->
            ( { model | nextClickable = True }, Cmd.none )

        UpdateCatsSlider value ->
            let
                oldSliderValues =
                    model.sliderValues

                newSliderValues =
                    { oldSliderValues | cats = value }
            in
                ( { model | sliderValues = newSliderValues }, Cmd.none )

        UpdateChildrenSlider value ->
            let
                oldSliderValues =
                    model.sliderValues

                newSliderValues =
                    { oldSliderValues | children = value }
            in
                ( { model | sliderValues = newSliderValues }, Cmd.none )

        UpdatePeopleSlider value ->
            let
                oldSliderValues =
                    model.sliderValues

                newSliderValues =
                    { oldSliderValues | people = value }
            in
                ( { model | sliderValues = newSliderValues }, Cmd.none )

        UpdatePetName name ->
            ( { model | petName = name }, Cmd.none )

        ImageSelected ->
            ( model
            , fileSelected model.imageId
            )

        ImageRead (Ok listImages) ->
            let
                debugit =
                    Debug.log "List Images" listImages
            in
                { model | image = Just listImages }
                    ! []

        ImageRead (Err _) ->
            { model | image = Nothing }
                ! []


port recordStart : String -> Cmd msg


port recordStop : String -> Cmd msg


port recordError : (String -> msg) -> Sub msg


port videoUrl : (String -> msg) -> Sub msg


port fileSelected : String -> Cmd msg


port fileContentRead : (String -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ videoUrl RecieveVideo
        , recordError RecordError
        , fileContentRead (decodeImageList >> ImageRead)
        , if not model.paused then
            Time.every second (always Increment)
          else
            Sub.none
        ]
