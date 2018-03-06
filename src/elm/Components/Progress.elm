module Components.Progress exposing (..)

import Html exposing (..)


-- import Html.Attributes exposing (..)

import Components.StyleHelpers exposing (classes)
import Types exposing (..)


progressBar : Model -> Html Msg
progressBar model =
    div [ classes [ "flex", "content-center", "items-center" ] ]
        [ div [ classes [ "br-100", "ba", "bw2", "h3", "w3", "b--green", "dib" ] ] []
        , line "green"
        , div [ classes [ "br-100", "ba", "bw2", "h3", "w3", "b--light-blue", "dib" ] ] []
        , line "light-blue"
        , div [ classes [ "br-100", "ba", "bw2", "h3", "w3", "b--light-blue", "dib" ] ] []
        , line "light-blue"
        , div [ classes [ "br-100", "ba", "bw2", "h3", "w3", "b--light-blue", "dib" ] ] []
        , line "light-blue"
        , div [ classes [ "br-100", "ba", "bw2", "h3", "w3", "b--light-blue", "dib" ] ] []
        , line "light-blue"
        , div [ classes [ "br-100", "ba", "bw2", "h3", "w3", "b--light-blue", "dib" ] ] []
        , line "light-blue"
        , div [ classes [ "br-100", "ba", "bw2", "h3", "w3", "b--light-blue", "dib" ] ] []
        , line "light-blue"
        , div [ classes [ "br-100", "ba", "bw2", "h3", "w3", "b--light-blue", "dib" ] ] []
        ]


routesList : List Route
routesList =
    [ HomeRoute
    , PetInfoRoute
    , BeforeYouBeginRoute
    , PersonalityRoute
    , NewHomeRoute
    , PhotosRoute
    , FindingAHomeRoute
    , OwnerInfoRoute
    ]


doneNode : Html Msg
doneNode =
    div [ classes [ "br-100", "ba", "bw2", "h3", "w3", "b--green", "dib" ] ] []


activeNode : Html Msg
activeNode =
    div [ classes [ "br-100", "ba", "bw2", "h3", "w3", "b--light-blue", "dib" ] ] []


futureNode : Html Msg
futureNode =
    div [ classes [ "br-100", "ba", "bw2", "h3", "w3", "b--light-blue", "dib" ] ] []


line : String -> Html Msg
line colour =
    div [ classes [ "w1", "bb", "bw2", "b--" ++ colour, "dib" ] ] []
