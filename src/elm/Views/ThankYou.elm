module Views.ThankYou exposing (..)

import Helpers exposing (getPetName)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


thankYou : Model -> Html Msg
thankYou model =
    div [ class "" ]
        [ section [ class "dn-ns" ]
            [ div [ class "" ]
                [ img [ src "./assets/doggo.png", class " w-100 db" ]
                    []
                ]
            , div
                [ class "w-100 bg-blue white h-auto" ]
                [ div [ class "tc pa2 pt3 b f3" ] [ text "Thank You!" ]
                , div [ class "tc pl4 pr4 pb3 f5 fw2" ]
                    [ div [ class "mb2" ] [ text <| "Thank-you for answering our questions, this will help us find" ++ getPetName model ++ "'s a great new home.  " ]
                    , div [ class "" ] [ text <| "We will be in touch within 2 days to arrange a time to come and see you and" ++ getPetName model ++ ", when we will plan his rehoming journey and any further support you need." ]
                    ]
                ]
            , div
                [ class "headerTitle bg-blue flex justify-center items-center h2 mb4" ]
                []
            ]
        , section [ class "dn dib-ns w-100" ]
            [ div [ class "background-dog cover db" ]
                [ div [ class "background-overlay aspect-ratio--object" ]
                    [ div [ class "w-50-ns w-90 center" ]
                        [ header [ class "white f1 o-100 tc pt5 b" ] [ text "Thank You!" ]
                        , p [ class "white f4 tc pt3" ] [ text <| "Thank-you for answering our questions, this will help us find" ++ getPetName model ++ "'s a great new home.  " ]
                        , p [ class "white f4 tc" ] [ text <| "We will be in touch within 2 days to arrange a time to come and see you and" ++ getPetName model ++ ", when we will plan his rehoming journey with you and any further support you need." ]
                        , div [ class "flex justify-center pt4" ]
                            [ a [ href "https://www.bluecross.org.uk/donate" ]
                                [ button [ class "white ba b--white br2 bg-transparent ph3 pv2 hover-bg-white hover-dark-blue ma2 f4" ] [ text "Donate" ]
                                ]
                            , a [ href "https://www.bluecross.org.uk/" ]
                                [ button [ class "white ba b--white br2 bg-transparent ph3 pv2 hover-bg-white hover-dark-blue ma2 f4" ] [ text "Back to Blue Cross Site" ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
