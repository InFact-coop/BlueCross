module Views.Health exposing (..)

import Components.BlueButton exposing (..)
import Components.StyleHelpers exposing (classes)
import Components.TextBox exposing (..)
import Helpers exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


health : Model -> Html Msg
health model =
    div [ class "w-60-ns w-90 center mw8" ]
        [ div [ class "blue b mb3" ] [ text <| "Is " ++ getPetName model ++ "..." ]
        , div [ class "mb3" ]
            [ input [ type_ "checkbox", onCheckboxInput ToggleMedicalDetail, id "vaccinated", value "Vaccinated" ] []
            , label [ for "vaccinated", class "gray ml2" ] [ text "Vaccinated?" ]
            ]
        , div [ class "mb3" ]
            [ input [ type_ "checkbox", onCheckboxInput ToggleMedicalDetail, id "neutered", value "Neutered" ] []
            , label [ for "neutered", class "gray ml2" ] [ text "Neutered?" ]
            ]
        , div [ class "mb3" ]
            [ input [ type_ "checkbox", onCheckboxInput ToggleMedicalDetail, id "microchipped", value "Microchipped" ] []
            , label [ for "microchipped", class "gray ml2" ] [ text "Microchipped?" ]
            ]
        , div [ class "mb3" ]
            [ input [ type_ "checkbox", onCheckboxInput ToggleMedicalDetail, id "Unknown", value "Unknown" ] []
            , label [ for "Unknown", class "gray ml2" ] [ text "Unknown" ]
            ]
        , div [ class "blue b mt4 pb3" ]
            [ text <| "When was " ++ getPetName model ++ "'s last visit to the vets?"
            , span [ class "fw1 f5" ] [ text " Required" ]
            ]
        , controlledBlueButton ( UpTo3Months, UpdateLastVetVisit ) "Up to 3 months" (model.lastVetVisit == UpTo3Months)
        , controlledBlueButton ( Between3To12Months, UpdateLastVetVisit ) "3 to 12 months" (model.lastVetVisit == Between3To12Months)
        , controlledBlueButton ( OverAYear, UpdateLastVetVisit ) "Over a year" (model.lastVetVisit == OverAYear)
        , controlledBlueButton ( UnknownSlashNever, UpdateLastVetVisit ) "Unknown/never" (model.lastVetVisit == UnknownSlashNever)
        , div [ class "blue b mb3 mt4" ] [ text <| "Anything else to note about " ++ getPetName model ++ "'s health?" ]
        , newTextBox ( "Please tell us here", "Health" ) UpdateOtherHealth
        , div [ class "mv4 tc w-100" ]
            [ a [ classes [ "link w-100 bg-navy br2 white pa3 br2 f4 dib cursor  w-100 w-25-l w-50-m", ifThenElse (model.nextClickable == True) "" "bg-gray disableButton o-30" ], href "#personality" ] [ text "Next" ]
            ]
        ]
