module Views.PetInfo exposing (..)

import Components.BlueButton exposing (..)
import Components.DogBreedDropDown exposing (..)
import Components.TextBox exposing (..)
import Data.DogBreeds exposing (..)
import Helpers exposing (getPetName)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, targetValue)
import Json.Decode as Json
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
            , customBlueButtons ( "Yes", "crossBreed" )
            , customBlueButtons ( "No", "crossBreed" )
            , div []
                [ div [ class "blue b mb2 mt4" ] [ text <| "What breed is " ++ getPetName model ++ "?" ] ]
            , div []
                [ select [ class "bg-light-blue bn w-80 w-50-ns gray tc pa3 mb3 f5 fw1 h2", id "dogBreed" ]
                    (List.map
                        dogBreedDropDown
                        dogBreedsList
                    )
                , p
                    [ class "mt0 blue" ]
                    [ text "&" ]
                , select [ class "bg-light-blue bn w-80 w-50-ns gray tc pa3 mb3 f5 fw1 h2", id "dogBreed" ]
                    (List.map
                        dogBreedDropDown
                        dogBreedsList
                    )
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
        , select [ class "bg-light-blue bn w-80 w-50-ns gray tc pa3 mb3 f5 fw1 h2", id "rehoming" ]
            [ option [ value "Cost" ]
                [ text "Cost" ]
            , option [ value "Babies" ]
                [ text "Babies" ]
            ]
        , div [ class "gray f6 fw1" ] [ text "Other:" ]
        , textBox ( "Please tell us why you are rehoming " ++ getPetName model, "rehoming" )
        , div [ class "blue b mb2 mt4" ] [ text <| "What sex is " ++ getPetName model ++ "?" ]
        , customBlueButtons ( "Male", "sex" )
        , customBlueButtons ( "Female", "sex" )
        , div [ class "blue b mb2 mt4" ] [ text <| "How old is " ++ getPetName model ++ "?" ]
        , customBlueButtons ( "0-1 year", "age" )
        , customBlueButtons ( "2-5 years", "age" )
        , customBlueButtons ( "6-10 years", "age" )
        , customBlueButtons ( "Over 10 years", "age" )
        , div [ class "tc w-100 mt4" ]
            [ a [ class "w-100 bg-navy br2 white pa3 br2 f4 dib link w-100 w-25-l w-50-m mb5", href "#before-you-begin" ] [ text "Next" ]
            ]
        ]
