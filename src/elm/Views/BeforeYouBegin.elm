module Views.BeforeYouBegin exposing (..)

import Components.BlueButton exposing (..)
import Components.StyleHelpers exposing (classes)
import Components.TextBox exposing (..)
import Helpers exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


beforeYouBegin : Model -> Html Msg
beforeYouBegin model =
    div [ class "w-60-ns w-90 center" ]
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
        , newBlueButton ( UpTo3Months, UpdateLastVetVisit ) "Up to 3 months"
        , newBlueButton ( Between3To12Months, UpdateLastVetVisit ) "3 to 12 months"
        , newBlueButton ( OverAYear, UpdateLastVetVisit ) "Over a year"
        , newBlueButton ( UnknownSlashNever, UpdateLastVetVisit ) "Unknown/never"
        , div [ class "blue b mb3 mt4" ] [ text <| "Anything else to note about " ++ getPetName model ++ "'s health?" ]
        , newTextBox ( "Please tell us here", "Health" ) UpdateOtherHealth
        , div [ class "mv4 tc w-100" ]
            [ a [ classes [ "link w-100 bg-navy br2 white pa3 br2 f4 dib cursor  w-100 w-25-l w-50-m", ifThenElse (model.nextClickable == True) "" "bg-gray disableButton o-30" ], href "#personality" ] [ text "Next" ]
            ]
        ]
