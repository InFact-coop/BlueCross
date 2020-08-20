module Requests.PostForm exposing (..)

import Helpers exposing (stringToInt, unionTypeToString)
import Http exposing (jsonBody, post)
import Json.Decode as Decode
import Json.Encode exposing (..)
import Types exposing (..)


postForm : Model -> Cmd Msg
postForm model =
    Http.send ReceiveFormStatus (formRequest model)


formRequest : Model -> Http.Request Bool
formRequest model =
    post "/api/v1/send-form" (jsonBody <| formObject model) (Decode.field "success" Decode.bool)


formObject : Model -> Value
formObject model =
    object
        [ ( "imageUrls", list <| List.map string (Maybe.withDefault [] model.imageUrls) )
        , ( "urgency", string <| unionTypeToString model.urgency )
        , ( "petName", string model.petName )
        , ( "crossBreed", string <| unionTypeToString model.crossBreed )
        , ( "primaryDogBreedType", string <| unionTypeToString (Maybe.withDefault DogBreedNotChosen model.primaryDogBreedType) )
        , ( "secondaryDogBreedType", string <| unionTypeToString (Maybe.withDefault DogBreedNotChosen model.secondaryDogBreedType) )
        , ( "primaryCatBreedType", string <| unionTypeToString (Maybe.withDefault CatBreedNotChosen model.primaryCatBreedType) )
        , ( "secondaryCatBreedType", string <| unionTypeToString (Maybe.withDefault CatBreedNotChosen model.secondaryCatBreedType) )
        , ( "primaryReasonForRehoming", string model.primaryReasonForRehoming )
        , ( "secondaryReasonForRehoming", string model.secondaryReasonForRehoming )
        , ( "otherReasonsForRehoming", string model.otherReasonsForRehoming )
        , ( "unknownBreed", string model.unknownBreed )
        , ( "gender", string <| unionTypeToString model.gender )
        , ( "age", string <| unionTypeToString model.age )
        , ( "medicalDetails", list (List.map string model.medicalDetails |> List.intersperse (string ", ")) )
        , ( "lastVetVisit", string <| unionTypeToString model.lastVetVisit )
        , ( "otherHealthNotes", string model.otherHealthNotes )
        , ( "personalityTraits", list (List.map string model.personalityTraits |> List.intersperse (string ", ")) )
        , ( "fundraisingContact", list (List.map string model.fundraisingContact |> List.intersperse (string ", ")) )
        , ( "otherPersonalityNotes", string model.otherPersonalityNotes )
        , ( "cats", string model.cats )
        , ( "children", string model.children )
        , ( "people", string model.people )
        , ( "dogs", string model.dogs )
        , ( "babies", string model.babies )
        , ( "otherNotes", string model.otherNotes )
        , ( "supportType", string model.supportType )
        , ( "ownerName", string model.ownerName )
        , ( "ownerPhone", string model.ownerPhone )
        , ( "alternativeOwnerPhone", string model.alternativeOwnerPhone )
        , ( "bestTimeToCall", string <| unionTypeToString model.bestTimeToCall )
        , ( "email", string model.email )
        , ( "address", string model.address )
        , ( "postcode", string model.postcode )
        ]
