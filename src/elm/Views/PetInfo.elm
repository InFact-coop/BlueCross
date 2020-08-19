module Views.PetInfo exposing (..)

import Components.BlueButton exposing (..)
import Components.BreedDropDown exposing (..)
import Components.StyleHelpers exposing (classes, defaultOption, displayElement)
import Components.TextBox exposing (..)
import Data.CatBreeds exposing (..)
import Data.DogBreeds exposing (..)
import Debug exposing (log)
import Helpers exposing (getPetName, ifThenElse, onBlurValue, unionTypeToString)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, targetValue)
import Json.Decode as Json exposing (Decoder, andThen)
import Types exposing (..)


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
                    [ select
                        [ classes [ "bg-light-blue bn w-80 w-33-ns gray tc pa3 f5 fw1 h2 form-control input-lg" ]
                        , id "primaryBreed"
                        , on "change" <|
                            ifThenElse (model.petType == Cat) (Json.map UpdatePrimaryCatBreed targetValueDecoderCatBreed) (Json.map UpdatePrimaryDogBreed targetValueDecoderDogBreed)
                        ]
                        ([ defaultOption ]
                            ++ (case model.petType of
                                    Cat ->
                                        List.map
                                            catBreedDropDown
                                            catBreedsList

                                    Dog ->
                                        List.map
                                            dogBreedDropDown
                                            dogBreedsList

                                    PetTypeNotChosen ->
                                        []
                               )
                        )
                    , p
                        [ classes [ "blue mh3 mv0", displayElement ((model.crossBreed /= No) && (model.crossBreed /= Neutral)) ] ]
                        [ text "&" ]
                    , select
                        [ classes [ "bg-light-blue bn w-80 w-33-ns gray tc pa3 f5 fw1 h2 form-control input-lg", displayElement ((model.crossBreed /= No) && (model.crossBreed /= Neutral)) ]
                        , on "change" <|
                            ifThenElse (model.petType == Cat) (Json.map UpdateSecondaryCatBreed targetValueDecoderCatBreed) (Json.map UpdateSecondaryDogBreed targetValueDecoderDogBreed)
                        , id "secondaryBreed"
                        ]
                        ([ defaultOption ]
                            ++ (case model.petType of
                                    Cat ->
                                        List.map
                                            catBreedDropDown
                                            catBreedsList

                                    Dog ->
                                        List.map
                                            dogBreedDropDown
                                            dogBreedsList

                                    PetTypeNotChosen ->
                                        []
                               )
                        )
                    ]
                ]
            ]
        , div [ classes [ displayElement (model.crossBreed == Neutral) ] ]
            [ div [ class "mt3 b blue mb2" ] [ text <| "What do you know about " ++ getPetName model ++ "'s breed?" ]
            , newTextBox ( "Please tell us what you know about " ++ getPetName model ++ "'s breed", "dogBreedOther" ) UpdateUnknownBreed
            ]
        , div [ class "blue b mb2 mt4" ] [ text <| "What is your main reason for rehoming " ++ getPetName model ++ "?" ]
        , div [ class "inline-flex items-center w-100" ]
            [ select [ class "bg-light-blue bn w-80 w-33-ns gray tc pa3 f5 fw1 h2 form-control input-lg", id "primaryReasonForRehoming", on "change" <| Json.map UpdatePrimaryReason targetValue ]
                [ option [ selected True, disabled True ] [ text "Please select one" ]
                , option [ value "Change of circumstance" ]
                    [ text "Change of circumstance" ]
                , option [ value "Health" ]
                    [ text <| getPetName model ++ "'s health" ]
                , option [ value "Behaviour" ]
                    [ text <| getPetName model ++ "'s behaviour" ]
                ]
            , p
                [ classes [ "blue mh3 mv0 b" ] ]
                [ text ":" ]
            , select [ classes [ "bg-light-blue bn w-80 w-33-ns gray tc pa3 f5 fw1 h2 form-control input-lg" ], id "secondaryReasonForRehoming", on "change" <| Json.map UpdateSecondaryReason targetValue ]
                ([ option [ selected True, disabled True ] [ text "Please select one" ]
                 ]
                    ++ secondaryReasons model
                )
            ]
        , div [ classes [ displayElement (model.secondaryReasonForRehoming == "Other") ] ]
            [ div [ class "gray f6 fw1 mt2 mb1" ] [ text "Other:" ]
            , newTextBox ( "Please give us a little more detail on why you are rehoming " ++ getPetName model, "rehoming" ) UpdateOtherReasons
            ]
        , div [ class "blue b mb2 mt4" ]
            [ text <| "What sex is " ++ getPetName model ++ "?"
            , span [ class "fw1 f5" ] [ text " Required" ]
            ]
        , controlledBlueButton ( Male, UpdateGender ) "Male" (model.gender == Male)
        , controlledBlueButton ( Female, UpdateGender ) "Female" (model.gender == Female)
        , div [ class "blue b mb2 mt4" ]
            [ text <| "How old is " ++ getPetName model ++ "?"
            , span [ class "fw1 f5" ] [ text " Required" ]
            ]
        , newBlueButton ( Between0To1Year, UpdateAge ) "0-1 year"
        , newBlueButton ( Between2To5Years, UpdateAge ) "2-5 years"
        , newBlueButton ( Between6To10Years, UpdateAge ) "6-10 years"
        , newBlueButton ( Over10Years, UpdateAge ) "Over 10 years"
        , div [ class "tc w-100 mt4" ]
            [ a [ classes [ "w-100 bg-navy br2 white pa3 br2 f4 dib link w-100 w-25-l w-50-m ", ifThenElse (model.nextClickable == True) "" "bg-gray disableButton o-30" ], href "#before-you-begin" ] [ text "Next" ]
            ]
        ]


secondaryReasons : Model -> List (Html Msg)
secondaryReasons model =
    case model.primaryReasonForRehoming of
        "Change of circumstance" ->
            [ reasonDropdown "Home"
            , reasonDropdown "Job"
            , reasonDropdown "Family"
            , reasonDropdown "Other"
            ]

        "Behaviour" ->
            [ reasonDropdown "Anxious when left"
            , reasonDropdown "Difficult to handle"
            , reasonDropdown "Overprotective of food or toys"
            , reasonDropdown "Not house-trained"
            , reasonDropdown "Unsafe with children"
            , reasonDropdown "Unsafe with strangers"
            , reasonDropdown ("Unsafe with other " ++ unionTypeToString model.petType ++ "s")
            , reasonDropdown "Other"
            ]

        "Health" ->
            [ reasonDropdown "Treatment"
            , reasonDropdown "Special care"
            , reasonDropdown "Other"
            ]

        _ ->
            []


targetValueDecoderDogBreed : Decoder DogBreed
targetValueDecoderDogBreed =
    targetValue
        |> andThen decoderDogBreed


targetValueDecoderCatBreed : Decoder CatBreed
targetValueDecoderCatBreed =
    targetValue
        |> andThen decoderCatBreed
