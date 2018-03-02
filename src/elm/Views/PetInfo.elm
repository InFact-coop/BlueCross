module Views.PetInfo exposing (..)

import Components.BlueButton exposing (..)
import Components.DogBreedDropDown exposing (..)
import Components.StyleHelpers exposing (classes, displayElement)
import Components.TextBox exposing (..)
import Data.DogBreeds exposing (..)
import Helpers exposing (getPetName)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, targetValue)
import Json.Decode as Json exposing (Decoder, andThen)
import Types exposing (..)


onBlurValue : (String -> msg) -> Attribute msg
onBlurValue tagger =
    on "blur" (Json.map tagger targetValue)


petInfo : Model -> Html Msg
petInfo model =
    div [ class "w-60-ns center ma3 ma0-ns" ]
        [ div
            [ class " blue b mb2" ]
            [ text "What is your pet's name?" ]
        , div []
            [ input [ type_ "text", class "bg-light-blue w-80 br2 pa3 gray bn", onBlurValue UpdatePetName ]
                [ text "" ]
            ]
        , div [ class "gray f6 fw1" ] [ text "Please enter your pet's name" ]
        , div []
            [ div [ class "blue b mb2 mt4" ] [ text <| "Is " ++ getPetName model ++ " a cross breed?" ]
            , newBlueButton ( Yes, UpdateCrossBreed ) "Yes"
            , newBlueButton ( No, UpdateCrossBreed ) "No"
            , newBlueButton ( Neutral, UpdateCrossBreed ) "Not sure"
            , div [ classes [ displayElement (model.crossBreed /= Neutral) ] ]
                [ div []
                    [ div [ class "blue b mb2 mt4" ] [ text <| "What breed is " ++ getPetName model ++ "?" ] ]
                , div []
                    [ select [ classes [ "bg-light-blue bn w-80 w-50-ns gray tc pa3 mb3 f5 fw1 h2" ], id "primaryDogBreed", on "change" <| Json.map UpdatePrimaryBreed targetValueDecoderBreed ]
                        (List.map
                            dogBreedDropDown
                            dogBreedsList
                        )
                    , p
                        [ classes [ "mt0 blue", displayElement (model.crossBreed /= No) ] ]
                        [ text "&" ]
                    , select [ classes [ "bg-light-blue bn w-80 w-50-ns gray tc pa3 mb3 f5 fw1 h2", displayElement (model.crossBreed /= No) ], on "change" <| Json.map UpdateSecondaryBreed targetValueDecoderBreed, id "secondaryDogBreed" ]
                        (List.map
                            dogBreedDropDown
                            dogBreedsList
                        )
                    ]
                ]
            ]
        , div []
            [ div [ class "gray f6 fw1" ] [ text "Other:" ]
            , div []
                [ input [ type_ "text", class "bg-light-blue w-80 br2 pa3 gray bn" ]
                    []
                ]
            ]
        , div [ class "blue b mb2 mt4" ] [ text <| "What is your reason for rehoming " ++ getPetName model ++ "?" ]
        , select [ class "bg-light-blue bn w-80 w-50-ns gray tc pa3 mb3 f5 fw1 h2", id "rehoming", on "change" <| Json.map UpdateReason targetValue ]
            [ option [ selected True, disabled True ] [ text "Please select one" ]
            , option [ value "Cost" ]
                [ text "Cost" ]
            , option [ value "Babies" ]
                [ text "Babies" ]
            , option [ value "Other" ]
                [ text "Other" ]
            ]
        , div [ class "gray f6 fw1" ] [ text "Other:" ]
        , newTextBox ( "Please tell us why you are rehoming " ++ getPetName model, "rehoming" ) UpdateOtherReasons
        , div [ class "blue b mb2 mt4" ] [ text <| "What sex is " ++ getPetName model ++ "?" ]
        , newBlueButton ( Male, UpdateGender ) "Male"
        , newBlueButton ( Female, UpdateGender ) "Female"
        , customBlueButton ( "Female", "sex" )
        , div [ class "blue b mb2 mt4" ] [ text <| "How old is " ++ getPetName model ++ "?" ]
        , customBlueButton ( "0-1 year", "age" )
        , customBlueButton ( "2-5 years", "age" )
        , customBlueButton ( "6-10 years", "age" )
        , customBlueButton ( "Over 10 years", "age" )
        , div [ class "tc w-100 mt4" ]
            [ a [ class "w-100 bg-navy br2 white pa3 br2 f4 dib link w-100 w-25-l w-50-m mb5", href "#before-you-begin" ] [ text "Next" ]
            ]
        ]


targetValueDecoderBreed : Decoder DogBreed
targetValueDecoderBreed =
    targetValue
        |> andThen decoderDogBreed
