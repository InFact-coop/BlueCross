module Views.OwnerInfo exposing (..)

import Helpers exposing (getPetName)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


ownerInfo : Model -> Html Msg
ownerInfo model =
    div [ class "ma3" ]
        [ div [ class "gray fw1 mb4 mt4" ] [ text "We just need to collect a few details from you so we can get in touch" ]
        , div [ class "blue b mb2 mt4" ] [ text "Name" ]
        , div []
            [ input [ type_ "text", class "bg-light-blue w-80 br2 pa3 gray bn" ]
                []
            ]
        , div [ class "blue b mb2 mt4" ] [ text "Phone Number" ]
        , div []
            [ input [ type_ "text", class "bg-light-blue w-80 br2 pa3 gray bn" ]
                []
            ]
        , div [ class "gray f6 fw1" ] [ text "Please enter your preferred contact number" ]
        , div [ class "blue b mb2 mt4" ] [ text "Email" ]
        , div []
            [ input [ type_ "text", class "bg-light-blue w-80 br2 pa3 gray bn" ]
                []
            ]
        , div [ class "mt4 tc w-100" ]
            [ a [ class "link w-100 bg-navy br2 white pa3 br2 f4 dib", href "#thank-you", onClick SubmitForm ] [ text "Submit" ]
            ]
        ]
