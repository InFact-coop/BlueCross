module State exposing (..)

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
        Change newInput ->
            ( { model | userInput = newInput }, Cmd.none )

        UrlChange location ->
            ( { model | route = getRoute location.hash, nextClickable = False }, Cmd.none )

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
