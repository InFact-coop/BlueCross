module Views.OwnerInfo exposing (..)

import Components.ContactButtons exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


ownerInfo : Model -> Html Msg
ownerInfo model =
    div [ class "w-60-ns center ma3 " ]
        [ div [ class "blue b mb4 mt4 f4 lh-copy" ] [ text "We just need to collect a few details from you so we can get in touch" ]
        , div [ class "blue b mb2 mt4" ] [ text "What is your name?*" ]
        , div []
            [ input [ type_ "text", class "bg-light-blue w-80 w-50-ns w-50-ns br2 pa3 gray bn", onInput UpdateOwnerName ]
                []
            ]
        , div [ class "blue b mb2 mt4" ] [ text "What is your daytime telephone number?" ]
        , div []
            [ input [ type_ "text", class "bg-light-blue w-80 w-50-ns br2 pa3 gray bn", onInput UpdateOwnerPhone ]
                []
            ]
        , div [ class "blue b mb2 mt4" ] [ text "Do you have an alternative phone number?" ]
        , div []
            [ input [ type_ "text", class "bg-light-blue w-80 w-50-ns br2 pa3 gray bn", onInput UpdateAlternativeOwnerPhone ]
                []
            ]
        , div [ class "blue b mb2 mt4" ]
            [ text "When is the best time to call?" ]
        , div
            [ class "w-25-l w-50 tc mb2 flex flex-column inline-flex flex-wrap center" ]
            [ input [ class "dn ", id "am", name "time", type_ "radio", value "am", onClick <| UpdateBestTimeToCall AM ]
                []
            , label [ class "health bg-white items-center justify-center bg-blue pointer mw4 br1 mr2 h1 br2 white tc pa3", for "am" ]
                [ text "am" ]
            ]
        , div
            [ class "w-25-l w-50 tc mb2 flex flex-column inline-flex flex-wrap center" ]
            [ input [ class "dn ", id "pm", name "time", type_ "radio", value "pm", onClick <| UpdateBestTimeToCall PM ]
                []
            , label [ class "health bg-white items-center justify-center bg-blue pointer mw4 br1 mr2 h1 br2 white tc pa3", for "pm" ]
                [ text "pm" ]
            ]
        , div
            [ class "w-25-l w-50 tc mb2 flex flex-column inline-flex flex-wrap center" ]
            [ input [ class "dn ", id "noPreference", name "time", type_ "radio", value "noPreference", onClick <| UpdateBestTimeToCall NoPreference ]
                []
            , label [ class "health bg-white items-center justify-center bg-blue pointer mw4 br1 mr2 h1 br2 white tc pa3", for "noPreference" ]
                [ text "No Preference" ]
            ]
        , div [ class "blue b mb2 mt4" ] [ text "Email*" ]
        , div []
            [ input [ type_ "email", class "bg-light-blue w-80 w-50-ns br2 pa3 gray bn", onInput UpdateOwnerEmail ]
                []
            ]
        , div [ class "blue b mb2 mt4" ]
            [ text "We be in touch within 2 days, how would you prefer to be contacted? Choose all that apply." ]
        , div [ class "mb4 h3" ]
            [ contactButton "Email"
            , contactButton "Phone"
            ]
        , div [ class "mt4 tc w-100 " ]
            [ a [ class "ink w-25-ns w-100 bg-navy br2 white pa3 br2 f4 dib no-underline", href "#thank-you", onClick SubmitForm ] [ text "Submit" ]
            , p [ class "mt1 gray fw1 " ] [ text "We will send you an email to confirm we have received your enquiry" ]
            ]
        ]
