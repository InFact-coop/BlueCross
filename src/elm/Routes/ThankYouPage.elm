module Routes.ThankYouPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


thankYouPage : Model -> Html Msg
thankYouPage model =
    div [ class "" ]
        [ div [ class "" ]
            [ img [ src "./assets/doggo.png", class " w-100 db" ]
                []
            ]
        , div
            [ class "w-100 bg-blue white h-auto" ]
            [ div [ class "tc pa2 pt3 b f3" ] [ text "Thank You!" ]
            , div [ class "tc pl4 pr4 pb3 f5 fw2" ] [ text "Thank you for filling out our questionnaire, this helps us match your pet with their new owner.\nWe’ll be in touch within 72 hours.  " ]
            ]
        ]
