module Components.Navbar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


navbar : Model -> Html Msg
navbar model =
    devNavbarContent



-- navbarContent


devNavbarLink : ( String, String ) -> Html Msg
devNavbarLink ( linkStr, name ) =
    li [ class "list dib ma3" ] [ a [ class "link dim white b", href ("/#" ++ linkStr) ] [ text name ] ]


devNavbarContent : Html Msg
devNavbarContent =
    ul [ class "dib ma0 bg-green w-100 pa2 justify-between" ] <| List.map devNavbarLink [ ( "home", "Home" ), ( "before-you-begin", "Before You Begin" ), ( "pet-info", "Pet Info" ), ( "location", "Location" ), ( "personality", "Personality" ), ( "likes", "Likes" ), ( "owner-info", "Owner Info" ), ( "thank-you", "Thank You" ) ]


navbarContent : Html Msg
navbarContent =
    ul [ class "dib ma0 bg-white w-100 pa2" ]
        [ li [ class "dib" ]
            [ img [ src "./assets/bx-logo.jpg", class "h3 w3 v-mid" ] []
            ]
        , li [ class "bg-blue dib pa3 br3 v-mid" ] [ text "Donate" ]
        ]
