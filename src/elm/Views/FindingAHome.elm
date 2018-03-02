module Views.FindingAHome exposing (..)

import Helpers exposing (getPetName)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


findingAHome : Model -> Html Msg
findingAHome model =
    div [ class "w-60-ns w-90 center" ]
        [ section []
            [ h2 [ class "blue f5 mv4" ] [ text <| "We can help you find a new home for " ++ getPetName model ++ " in a couple of different ways.  Which would suit you and " ++ getPetName model ++ " best?" ]
            ]
        , div [ class "mb3" ]
            [ input [ type_ "checkbox", id "rehomingCentre" ] []
            , label [ for "rehomingCentre", class "gray ml2" ]
                [ span [ class "b" ] [ text "Rehoming Centre: " ]
                , text <| "We will look after" ++ getPetName model ++ " at our Rehoming centre until we find " ++ getPetName model ++ " a great new home"
                ]
            ]
        , div [ class "mb3" ]
            [ input [ type_ "checkbox", id "homeDirect" ] []
            , label [ for "homeDirect", class "gray ml2" ]
                [ span [ class "b" ] [ text "Home Direct: " ]
                , text <| getPetName model ++ " will stay with you while we find a great new home"
                ]
            ]
        , div [ class "mb2" ]
            [ input [ type_ "checkbox", id "none" ] []
            , label [ for "none", class "gray ml2" ]
                [ span [ class "b" ] [ text "Unsure: " ]
                , text "We can talk through the options with you and you can decide what works best for you."
                ]
            ]
        , div
            [ class "mt5 tc w-100" ]
            [ a [ class "link w-25-ns w-100 bg-navy br2 white pa3 br2 f4 dib", href "#owner-info" ] [ text "Next" ]
            ]
        ]
