port module State exposing (..)

import Dom.Scroll exposing (..)
import Navigation exposing (..)
import Requests.PostForm exposing (postForm)
import Router exposing (getRoute, viewFromUrl)
import Task
import Time exposing (Time, second)
import Types exposing (..)


initModel : Model
initModel =
    { route = PersonalityRoute
    , nextClickable = False
    , cats = "50"
    , children = "50"
    , people = "50"
    , dogs = "50"
    , babies = "50"
    , videoMessage = ""
    , messageLength = 0
    , videoStage = Stage0
    , paused = True
    , petName = ""
    , formStatus = NotAsked
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

        RecordStop string ->
            ( model, recordStop string )

        RecieveVideo string ->
            { model | videoMessage = string } ! []

        RecordError err ->
            { model | videoStage = StageErr } ! []

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

        SubmitForm ->
            { model | formStatus = Loading } ! [ postForm model ]


port recordStart : String -> Cmd msg


port recordStop : String -> Cmd msg


port recordError : (String -> msg) -> Sub msg


port videoUrl : (String -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ videoUrl RecieveVideo
        , recordError RecordError
        , if not model.paused then
            Time.every second (always Increment)
          else
            Sub.none
        ]
