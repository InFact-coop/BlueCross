module Views.ThankYou exposing (..)

import Helpers exposing (getPetName)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


thankYou : Model -> Html Msg
thankYou model =
    div [ class "" ]
        [ section [ class "dn-ns" ]
            [ div [ class "" ]
                [ img [ src "./assets/doggo.png", class " w-100 db" ]
                    []
                ]
            , div
                [ class "w-100 bg-blue white h-auto" ]
                [ div [ class "tc pa2 pt3 b f3" ] [ text "Thank You!" ]
                , div [ class "tc pl4 pr4 pb3 f5 fw2" ]
                    [ div [ class "mb2" ] [ text <| "Thank you for filling out our questionnaire, this helps us match " ++ getPetName model ++ " with their new owner." ]
                    , div [ class "b" ] [ text "We’ll be in touch within 72 hours." ]
                    ]
                ]
            , div
                [ class "headerTitle bg-blue flex justify-center items-center h2 mb4" ]
                []
            ]
        , section [ class "dn dib-ns" ]
            [ img [ src "./assets/doggo.png", class " w-100 db vh-90 contain" ] []
            ]
        ]
