port module State exposing (..)

import Time exposing (Time, second)
import Types exposing (..)


-- MODEL


initModel : Model
initModel =
    { route = HomeRoute
    , userInput = ""
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
    }



--UPDATE


getRoute : String -> Route
getRoute hash =
    case hash of
        "#home" ->
            HomeRoute

        "#before-you-begin" ->
            BeforeYouBeginRoute

        "#pet-info" ->
            PetInfoRoute

        "#location" ->
            LocationRoute

        "#personality" ->
            PersonalityRoute

        "#owner-info" ->
            OwnerInfoRoute

        "#thank-you" ->
            ThankYouRoute

        "#upload-video" ->
            VideoRoute

        "#new-home" ->
            NewHomeRoute

        _ ->
            NotFoundRoute


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
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

        ToggleVideo stage ->
            case stage of
                Stage2 ->
                    ( { model | videoStage = Stage0 }, Cmd.none )

                Stage1 ->
                    ( { model | videoStage = Stage2, nextClickable = True }, recordStop "yes" )

                Stage0 ->
                    ( { model | videoStage = Stage1 }, recordStart "yes" )

        Change newInput ->
            ( { model | userInput = newInput }, Cmd.none )

        UrlChange location ->
            ( { model | route = getRoute location.hash, nextClickable = False, videoStage = Stage0, videoMessage = "" }, Cmd.none )

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


port recordStart : String -> Cmd msg


port recordStop : String -> Cmd msg


port videoUrl : (String -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ videoUrl RecieveVideo
        , if not model.paused then
            Time.every second (always Increment)
          else
            Sub.none
        ]
