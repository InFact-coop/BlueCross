module Components.Terms exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


terms : Model -> Html Msg
terms model =
    footer [ class "center tc f6 mb5 mt3" ]
        [ a [ href "https://www.bluecross.org.uk/privacy-and-cookie-policy", target "blank", class "no-underline dark-blue" ] [ text "Blue Cross Privacy & Cookie policy " ]
        , a [ href "https://www.cross.org.uk/terms-and-conditions", target "blank", class "no-underline dark-blue" ] [ text "& Terms of services" ]
        ]
