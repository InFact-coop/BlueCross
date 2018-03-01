module Views.BeforeYouBegin exposing (..)

import Components.BlueButton exposing (..)
import Components.TextBox exposing (..)
import Helpers exposing (getPetName)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


beforeYouBegin : Model -> Html Msg
beforeYouBegin model =
    div [ class "w-60-ns w-90 center" ]
        [ div [ class "blue b mb3" ] [ text <| "Is " ++ getPetName model ++ "..." ]
        , div [ class "mb3" ]
            [ input [ type_ "checkbox", id "vaccinated" ] []
            , label [ for "vaccinated", class "gray ml2" ] [ text "Vaccinated?" ]
            ]
        , div [ class "mb3" ]
            [ input [ type_ "checkbox", id "neutered" ] []
            , label [ for "neutered", class "gray ml2" ] [ text "Neutered?" ]
            ]
        , div [ class "mb3" ]
            [ input [ type_ "checkbox", id "microchipped" ] []
            , label [ for "microchipped", class "gray ml2" ] [ text "Microchipped?" ]
            ]
        , div [ class "mb3" ]
            [ input [ type_ "checkbox", id "Unknown" ] []
            , label [ for "Unknown", class "gray ml2" ] [ text "Unknown" ]
            ]
        , div [ class "blue b mt4 pb3" ] [ text <| "When was " ++ getPetName model ++ "'s last visit to the vets?" ]
        , customBlueButton ( "Up to 3 months", "health" )
        , customBlueButton ( "3 to 12 months", "health" )
        , customBlueButton ( "Over a year", "health" )
        , customBlueButton ( "Unknown/never", "health" )
        , div [ class "blue b mb3 mt4" ] [ text <| "Anything else to note about " ++ getPetName model ++ "'s health?" ]
        , textBox ( "Please tell us here", "Health" )
        , div [ class "mv4 tc w-100" ]
            [ a [ class "link w-100 bg-navy br2 white ph3 pv2 br2 f4 dib cursor  w-100 w-25-l w-50-m", href "#personality" ] [ text "Next" ]
            ]
        ]
