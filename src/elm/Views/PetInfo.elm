module Views.PetInfo exposing (..)

import Components.BlueButton exposing (..)
import Components.DogBreedDropDown exposing (..)
import Components.StyleHelpers exposing (classes, defaultOption, displayElement)
import Components.TextBox exposing (..)
import Data.DogBreeds exposing (..)
import Helpers exposing (getPetName, ifThenElse)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, targetValue)
import Json.Decode as Json exposing (Decoder, andThen)
import TransitStyle exposing (..)
import Types exposing (..)


onBlurValue : (String -> msg) -> Attribute msg
onBlurValue tagger =
    on "blur" (Json.map tagger targetValue)


petInfo : Model -> Html Msg
petInfo model =
    div [ class "w-60-ns w-90 center ma3 ma0-ns mw8" ]
        [ div
            [ class " blue b mb2" ]
            [ text "What is your pet's name?"
            , span [ class "fw1 f5" ] [ text " Required" ]
            ]
        , div []
            [ input [ type_ "text", class "bg-light-blue w-80 br2 pa3 gray bn", onBlurValue UpdatePetName ]
                [ text "" ]
            ]
        , div [ class "gray f6 fw1" ] [ text "Please enter your pet's name" ]
        , div []
            [ div [ class "blue b mb2 mt4" ]
                [ text <| "Is " ++ getPetName model ++ " a cross breed?"
                , span [ class "fw1 f5" ] [ text " Required" ]
                ]
            , newBlueButton ( Yes, UpdateCrossBreed ) "Yes"
            , newBlueButton ( No, UpdateCrossBreed ) "No"
            , newBlueButton ( Neutral, UpdateCrossBreed ) "Not sure"
            , div [ classes [ displayElement (model.crossBreed /= Neutral) ] ]
                [ div []
                    [ div [ class "blue b mt4 mb2" ]
                        [ text <| "What breed is " ++ getPetName model ++ "?"
                        , span [ class "fw1 f5" ] [ text " Required" ]
                        ]
                    ]
                , div [ class "inline-flex items-center  w-100" ]
                    [ select [ classes [ "bg-light-blue bn w-80 w-33-ns gray tc pa3 f5 fw1 h2" ], id "primaryDogBreed", on "change" <| Json.map UpdatePrimaryBreed targetValueDecoderBreed ]
                        ([ defaultOption ]
                            ++ List.map
                                dogBreedDropDown
                                dogBreedsList
                        )
                    , p
                        [ classes [ " blue mh3 mv0", displayElement (model.crossBreed /= No) ] ]
                        [ text "&" ]
                    , select [ classes [ "bg-light-blue bn w-80 w-33-ns gray tc pa3 f5 fw1 h2", displayElement (model.crossBreed /= No) ], on "change" <| Json.map UpdateSecondaryBreed targetValueDecoderBreed, id "secondaryDogBreed" ]
                        ([ defaultOption ]
                            ++ List.map
                                dogBreedDropDown
                                dogBreedsList
                        )
                    ]
                ]
            ]
        , div [ class "blue b mb2 mt4" ] [ text <| "What is your main reason for rehoming " ++ getPetName model ++ "?" ]
        , div [ class "inline-flex items-center w-100" ]
            [ select [ class "bg-light-blue bn w-80 w-33-ns gray tc pa3 f5 fw1 h2", id "primaryReasonForRehoming", on "change" <| Json.map UpdatePrimaryReason targetValue ]
                [ option [ selected True, disabled True ] [ text "Please select one" ]
                , option [ value "Behaviour" ]
                    [ text "Behaviour" ]
                , option [ value "Financial" ]
                    [ text "Financial" ]
                , option [ value "Other" ]
                    [ text "Other" ]
                ]
            , p
                [ classes [ "blue mh3 mv0 b", displayElement (model.primaryReasonForRehoming == "Behaviour" || model.primaryReasonForRehoming == "Financial") ] ]
                [ text ":" ]
            , select [ classes [ "bg-light-blue bn w-80 w-33-ns gray tc pa3 f5 fw1 h2", displayElement (model.primaryReasonForRehoming == "Behaviour" || model.primaryReasonForRehoming == "Financial") ], id "secondaryReasonForRehoming", on "change" <| Json.map UpdateSecondaryReason targetValue ]
                ([ option [ selected True, disabled True ] [ text "Please select one" ]
                 ]
                    ++ secondaryReasons model
                )
            ]
        , div [ classes [ displayElement (model.primaryReasonForRehoming == "Other") ] ]
            [ div [ class "gray f6 fw1 mt2" ] [ text "Other:" ]
            , newTextBox ( "Please tell us why you are rehoming " ++ getPetName model, "rehoming" ) UpdateOtherReasons
            ]
        , div [ class "blue b mb2 mt4" ]
            [ text <| "What sex is " ++ getPetName model ++ "?"
            , span [ class "fw1 f5" ] [ text " Required" ]
            ]
        , newBlueButton ( Male, UpdateGender ) "Male"
        , newBlueButton ( Female, UpdateGender ) "Female"

        -- , newBlueButton ( UpTo3Months, UpdateLastVetVisit ) "Up to 3 months"
        -- , newBlueButton ( Between3To12Months, UpdateLastVetVisit ) "3 to 12 months"
        -- , newBlueButton ( OverAYear, UpdateLastVetVisit ) "Over a year"
        -- , newBlueButton ( UnknownSlashNever, UpdateLastVetVisit ) "Unknown/never"
        , div [ class "blue b mb2 mt4" ]
            [ text <| "How old is " ++ getPetName model ++ "?"
            , span [ class "fw1 f5" ] [ text " Required" ]
            ]
        , newBlueButton ( Between0To1Year, UpdateDogAge ) "0-1 year"
        , newBlueButton ( Between2To5Years, UpdateDogAge ) "2-5 years"
        , newBlueButton ( Between6To10Years, UpdateDogAge ) "6-10 years"
        , newBlueButton ( Over10Years, UpdateDogAge ) "Over 10 years"
        , div [ class "tc w-100 mt4" ]
            [ a [ classes [ "w-100 bg-navy br2 white pa3 br2 f4 dib link w-100 w-25-l w-50-m ", ifThenElse (model.nextClickable == True) "" "bg-gray disableButton o-30" ], href "#before-you-begin" ] [ text "Next" ]
            ]
        ]


secondaryReasons : Model -> List (Html Msg)
secondaryReasons model =
    case model.primaryReasonForRehoming of
        "Behaviour" ->
            [ reasonDropdown "Aggression towards children"
            , reasonDropdown "Aggression towards familiar people"
            , reasonDropdown "Aggression towards own species (living with)"
            , reasonDropdown "Aggression towards own species "
            , reasonDropdown "Aggression towards other species (living with)"
            , reasonDropdown "Aggression towards unfamiliar people"
            , reasonDropdown "Destructive when left"
            , reasonDropdown "Food aggression"
            , reasonDropdown "Inappropriate toileting"
            , reasonDropdown "Riding problems"
            , reasonDropdown "Unable to handle"
            , reasonDropdown "Other"
            ]

        "Financial" ->
            [ reasonDropdown "Loss of home"
            , reasonDropdown "Loss of job"
            , reasonDropdown "Too expensive to keep"
            , reasonDropdown "Other"
            ]

        _ ->
            []


targetValueDecoderBreed : Decoder DogBreed
targetValueDecoderBreed =
    targetValue
        |> andThen decoderDogBreed
