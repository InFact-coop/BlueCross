module Views.ThankYou exposing (..)

import Helpers exposing (getPetName, ifThenElse, pronounConverter)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


thankYou : Model -> Html Msg
thankYou model =
    div [ class "" ]
        [ section [ class "dn-ns" ]
            [ div [ class "" ]
                [ img [ src <| ifThenElse (model.petType == Dog) "./assets/doggo.jpeg" "./assets/cat.png", class " w-100 db" ]
                    []
                ]
            , div
                [ class "w-100 bg-blue white " ]
                [ div [ class "tc pa2 pt3 b f3" ] [ text "Thank You!" ]
                , div [ class "tc pl4 pr4 pb3 f5 fw2" ]
                    [ div [ class "mb2" ] [ text <| "Thank you for answering our questions. We will be in touch within 2 days to follow up on your enquiry. Then if you do decide you would like us to help you find a new home for " ++ getPetName model ++ ", we will arrange a time to come and see you both." ]
                    , p []
                        [ text "We know saying goodbye to a much loved pet is hard, if you need somebody to talk to, details of our confidential Pet Bereavement Support Service can be found "
                        , a [ href "https://www.bluecross.org.uk/pet-bereavement-and-pet-loss", target "blank", class "b white no-underline" ]
                            [ span
                                []
                                [ text "here" ]
                            ]
                        ]
                    , a [ class "no-underline b white", href "https://www.bluecross.org.uk/donate" ] [ text "Donate to Blue Cross" ]
                    ]
                ]
            , div
                [ class "headerTitle bg-blue flex justify-center items-center h2 mb4" ]
                []
            ]
        , section [ class "dn dib-ns w-100" ]
            [ div [ class "background-dog cover db" ]
                [ div [ class "background-overlay aspect-ratio--object flex items-center" ]
                    [ div [ class "w-50-ns w-90 center" ]
                        [ header [ class "white f1 o-100 tc b" ] [ text "Thank You!" ]
                        , p [ class "white f-custom  fw1 tc pt3 lh-copy " ] [ text <| "Thank-you for answering our questions" ]
                        , p [ class "white f-custom fw1 tc lh-copy " ] [ text <| "We will be in touch within 2 days to arrange a time to plan " ++ pronounConverter "their" model.gender ++ " rehoming journey with you and any further support you need." ]
                        , p [ class "white f-custom fw1 tc lh-copy " ]
                            [ text "We know saying goodbye to a much loved pet is hard, if you need somebody to talk to, details of our confidential Pet Bereavement Support Service can be found "
                            , a [ href "https://www.bluecross.org.uk/pet-bereavement-and-pet-loss", target "blank", class "b white no-underline" ]
                                [ span
                                    []
                                    [ text "here" ]
                                ]
                            ]
                        , div [ class "flex justify-center pt4 " ]
                            [ a [ href "https://www.bluecross.org.uk/donate" ]
                                [ button [ class "hover-transition white ba b--white br2 bg-transparent ph4 pv3 hover-bg-white hover-dark-blue ma2 f-custom pointer" ] [ text "Donate" ]
                                ]
                            , a [ href "https://www.bluecross.org.uk/" ]
                                [ button [ class "hover-transition white ba b--white br2 bg-transparent ph4 pv3 hover-bg-white hover-dark-blue ma2 f-custom pointer" ] [ text "Back to Blue Cross Site" ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
