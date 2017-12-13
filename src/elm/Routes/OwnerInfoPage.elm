module Routes.OwnerInfoPage exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Helpers.GetPetName exposing (..)


ownerInfoPage : Model -> Html Msg
ownerInfoPage model =
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
        , div [ class "blue b mb2 mt4" ] [ text "Please let us know what support you would like?" ]
        , div [ class "mb3" ]
            [ input [ type_ "checkbox", id "talk" ] []
            , label [ for "talk", class "gray ml2" ] [ text <| "Talk to potential owners directly and rehome " ++ getPetName model ++ " from your home?" ]
            ]
        , div [ class "mb3" ]
            [ input [ type_ "checkbox", id "bxHelp" ] []
            , label [ for "bxHelp", class "gray ml2" ] [ text <| "Rehome " ++ getPetName model ++ " from home but Blue Cross will help you find owners?" ]
            ]
        , div [ class "mb2" ]
            [ input [ type_ "checkbox", id "bxCentre" ] []
            , label [ for "bxCentre", class "gray ml2" ] [ text <| "Blue Cross to look after " ++ getPetName model ++ " at our centre and rehome them for you?" ]
            ]
        , div [ class "mt4 tc w-100" ]
            [ a [ class "link w-100 bg-navy br2 white pa3 br2 f4 dib", href "#thank-you" ] [ text "Next" ]
            ]
        ]
