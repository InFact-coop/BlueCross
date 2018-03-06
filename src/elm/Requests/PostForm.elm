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
        , ( "primaryBreedType", string <| unionTypeToString (Maybe.withDefault NULL model.primaryBreedType) )
        , ( "secondaryBreedType", string <| unionTypeToString (Maybe.withDefault NULL model.secondaryBreedType) )
        , ( "primaryReasonForRehoming", string model.primaryReasonForRehoming )
        , ( "secondaryReasonForRehoming", string model.secondaryReasonForRehoming )
        , ( "otherReasonsForRehoming", string model.otherReasonsForRehoming )
        , ( "dogGender", string <| unionTypeToString model.dogGender )
        , ( "dogAge", string <| unionTypeToString model.dogAge )
        , ( "medicalDetails", list (List.map string model.medicalDetails) )
        , ( "lastVetVisit", string <| unionTypeToString model.lastVetVisit )
        , ( "otherHealthNotes", string model.otherHealthNotes )
        , ( "personalityTraits", list (List.map string model.personalityTraits) )
        , ( "contactMethods", list (List.map string model.contactMethods) )
        , ( "otherPersonalityNotes", string model.otherPersonalityNotes )
        , ( "cats", string model.cats )
        , ( "children", string model.children )
        , ( "people", string model.people )
        , ( "dogs", string model.dogs )
        , ( "babies", string model.babies )
        , ( "otherNotes", string model.otherNotes )
        , ( "supportType", list (List.map string model.supportType) )
        , ( "ownerName", string model.ownerName )
        , ( "ownerPhone", string model.ownerPhone )
        , ( "alternativeOwnerPhone", string model.alternativeOwnerPhone )
        , ( "bestTimeToCall", string <| unionTypeToString model.bestTimeToCall )
        , ( "email", string model.email )
        ]
