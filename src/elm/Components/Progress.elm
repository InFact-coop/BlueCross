module Components.Progress exposing (..)

import Components.StyleHelpers exposing (backgroundImageStyle, classes)
import Helpers exposing (ifThenElse)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


progressBar : Model -> Html Msg
progressBar model =
    section [ class "w-60-ns w-90 center ma3 ma0-ns mw8" ]
        [ header [ class "b dark-blue f4" ]
            [ text "Progress" ]
        , div
            [ classes [ "flex", "justify-center", "items-center", "center", "mb5-ns", "mb3", "mt3" ] ]
            (routeToProgressBar routesList model)
        ]


routeToProgressBar : List ( Int, Route ) -> Model -> List (Html Msg)
routeToProgressBar list model =
    let
        activeRoute =
            list
                |> List.filter (\route -> Tuple.second route == model.route)
                |> List.head
                |> Maybe.withDefault ( 0, ThankYouRoute )

        activeNodes =
            ifThenElse (model.route /= HomeRoute) [ line "green", activeNode ] [ activeNode ]
                ++ ifThenElse (model.route /= OwnerInfoRoute) [ line "light-blue" ] []

        doneNodes =
            list
                |> List.take (Tuple.first activeRoute - 1)
                |> List.map (\route -> doneNode)
                |> List.intersperse (line "green")

        futureNodes =
            list
                |> List.drop (Tuple.first activeRoute)
                |> List.map (\route -> futureNode <| Tuple.first route)
                |> List.intersperse (line "light-blue")
    in
        doneNodes ++ activeNodes ++ futureNodes


routesList : List ( Int, Route )
routesList =
    [ ( 1, HomeRoute )
    , ( 2, PetInfoRoute )
    , ( 3, BeforeYouBeginRoute )
    , ( 4, PersonalityRoute )
    , ( 5, NewHomeRoute )
    , ( 6, PhotosRoute )
    , ( 7, FindingAHomeRoute )
    , ( 8, OwnerInfoRoute )
    ]


doneNode : Html Msg
doneNode =
    div [ classes [ "br-100", "ba", "bw1", "bw2-ns", "h-vw6", "w-vw6", "flex", "items-center", "justify-center", "b--green", "dib" ], backgroundImageStyle "./assets/tick.svg" 55 ] []


activeNode : Html Msg
activeNode =
    div [ classes [ "br-100", "ba", "bw1", "bw2-ns", "h-vw6", "w-vw6", "flex", "items-center", "justify-center", "b--blue", "dib" ], backgroundImageStyle "./assets/dog.svg" 55 ] []


futureNode : Int -> Html Msg
futureNode int =
    div [ classes [ "br-100", "ba", "bw1", "bw2-ns", "h-vw6", "w-vw6", "flex", "items-center", "justify-center", "b--light-blue", "dib", "light-blue", "f2-l", "f3-m", "f4" ] ] [ text <| toString int ]


line : String -> Html Msg
line colour =
    div [ classes [ "w1-ns", "w05", "bb", "bw1", "bw2-ns", "b--" ++ colour, "dib" ] ] []
