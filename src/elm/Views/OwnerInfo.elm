module Views.OwnerInfo exposing (..)

import Components.FundraisingContact exposing (..)
import Components.StyleHelpers exposing (classes)
import Helpers exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


ownerInfo : Model -> Html Msg
ownerInfo model =
    div [ class "w-60-ns w-90 center ma3 ma0-ns mw8" ]
        [ div [ class "blue b mb4 mt4 f4 lh-copy" ] [ text "We just need to collect a few details from you so we can get in touch" ]
        , div [ class "blue b mb2 mt4" ]
            [ text "What is your name?"
            , span [ class "fw1 f5" ] [ text " Required" ]
            ]
        , div []
            [ input [ type_ "text", class "bg-light-blue w-80 w-50-ns w-50-ns br2 pa3 gray bn", onInput UpdateOwnerName ]
                []
            ]
        , div [ class "blue b mb2 mt4" ] [ text "What is your daytime telephone number?" ]
        , div []
            [ input [ id "ownerPhone", type_ "text", class "bg-light-blue w-80 w-50-ns br2 pa3 gray bn", value model.ownerPhone, onInput UpdateOwnerPhone ]
                []
            ]
        , div [ class "blue b mb2 mt4" ] [ text "Do you have an alternative phone number?" ]
        , div []
            [ input [ type_ "text", class "bg-light-blue w-80 w-50-ns br2 pa3 gray bn", onInput UpdateAlternativeOwnerPhone, value model.alternativeOwnerPhone ]
                []
            ]
        , div [ class "blue b mb2 mt4" ]
            [ text "When is the best time to call?" ]
        , div
            [ class "w-25-l w-50 tc mb2 flex flex-column inline-flex flex-wrap center" ]
            [ input [ class "dn ", id "am", name "time", type_ "radio", value "am", onClick <| UpdateBestTimeToCall AM ]
                []
            , label [ class "health bg-white items-center justify-center bg-blue pointer mw4 br1 mr2 h1 br2 white tc pa3 checkedLabel", for "am" ]
                [ text "am" ]
            ]
        , div
            [ class "w-25-l w-50 tc mb2 flex flex-column inline-flex flex-wrap center" ]
            [ input [ class "dn ", id "pm", name "time", type_ "radio", value "pm", onClick <| UpdateBestTimeToCall PM ]
                []
            , label [ class "health bg-white items-center justify-center bg-blue pointer mw4 br1 mr2 h1 br2 white tc pa3 checkedLabel", for "pm" ]
                [ text "pm" ]
            ]
        , div
            [ class "w-25-l w-50 tc mb2 flex flex-column inline-flex flex-wrap center" ]
            [ input [ class "dn ", id "noPreference", name "time", type_ "radio", value "noPreference", onClick <| UpdateBestTimeToCall NoPreference ]
                []
            , label [ class "health bg-white items-center justify-center bg-blue pointer mw4 br1 mr2 h1 br2 white tc pa3 checkedLabel", for "noPreference" ]
                [ text "No Preference" ]
            ]
        , div [ class "blue b mb2 mt4" ]
            [ text "Email"
            , span [ class "fw1 f5" ] [ text " Required" ]
            ]
        , div []
            [ input [ type_ "email", classes [ "w-80 w-50-ns br2 pa3 gray", ifThenElse (model.emailIsValid == Just True || model.emailIsValid == Nothing || model.email == "") "bg-light-blue bn" "bg-washed-red ba bw1 b--red" ], ifThenElse (model.email == "") onBlurValue onInput UpdateOwnerEmail ]
                []
            ]
        , div [ class "blue b mb2 mt4" ]
            [ text "Address"
            ]
        , div []
            [ input [ type_ "text", class "bg-light-blue w-80 w-50-ns w-50-ns br2 pa3 gray bn", onInput UpdateAddress ]
                []
            ]
        , div [ class "blue b mb2 mt4" ]
            [ text "Postcode"
            , span [ class "fw1 f5" ] [ text " Required" ]
            ]
        , div []
            [ input [ type_ "text", classes [ "bg-light-blue w-80 w-50-ns w-50-ns br2 pa3 gray", ifThenElse (model.postCodeIsValid == Just True || model.postCodeIsValid == Nothing || model.postcode == "") "bg-light-blue bn" "bg-washed-red ba bw1 b--red" ], value model.postcode, ifThenElse (model.postcode == "") onBlurValue onInput UpdatePostcode ]
                []
            ]
        , div [ class "blue b mb2 mt4 f4" ]
            [ text <| "We be in touch within 2 days o help you find a new home for " ++ getPetName model ++ "." ]
        , div [ class "lh-copy gray fw1 f5" ]
            [ p []
                [ text "Blue Cross would like to tell you about the great work we do for pets and the different ways in which you could support us, this may include fundraising activities, appeals and merchandise." ]
            , p [ class "mb1" ] [ text "Please tick below if you are happy for us to contact you by:" ]
            , div []
                [ fundraisingButton ( "Email", "Email" )
                , fundraisingButton ( "Phone", "Phone" )
                , fundraisingButton ( "Text Message", "Text" )
                ]
            , p [ class "mid-gray fw1 f6" ]
                [ text "You can unsubscribe or change your preferences at any time by contacting our Supporter Careteam on 0300 790 9903 or emailing info@bluecross.org.uk"
                , br [] []
                , text "Blue Cross respects your privacy and will keep your information safe and secure and will only use them in accordance with our Privacy Policy. We will not sell, rent or share your personal data with other organisations for their marketing purposes. We may use your data for profiling purposes to make future communications more relevant to you. To see more about how we will use your information visit bluecross.org.uk/privacy"
                ]
            ]
        , div [ class "mt4 tc w-100 " ]
            [ a [ classes [ "link w-25-l w-50-m w-100 br2 white pa3 br2 f4 dib no-underline", ifThenElse (model.nextClickable == True) "bg-navy" "bg-gray disableButton o-30" ], href "#thank-you", onClick SubmitForm ] [ text "Submit" ]
            , p [ class "mt2-ns mt1 gray fw1 " ] [ text "We will send you an email to confirm we have received your enquiry" ]
            ]
        ]
