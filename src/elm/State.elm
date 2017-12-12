module State exposing (..)

import Types exposing (..)


-- MODEL


initModel : Model
initModel =
    { route = BeforeYouBeginRoute
    , userInput = ""
    , nextClickable = False
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

        "#likes" ->
            LikesRoute

        "#owner-info" ->
            OwnerInfoRoute

        "#thank-you" ->
            ThankYouRoute

        "#upload-video" ->
            VideoRoute

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
