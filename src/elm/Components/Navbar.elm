module Components.Navbar exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)


navbar : Model -> Html Msg
navbar model =
    -- devNavbarContent
    navbarContent


devNavbarLink : ( String, String ) -> Html Msg
devNavbarLink ( linkStr, name ) =
    li [ class "list dib ma3" ] [ a [ class "link dim white b", href ("/#" ++ linkStr) ] [ text name ] ]


devNavbarContent : Html Msg
devNavbarContent =
    ul [ class "dib ma0 w-100 pa2" ] <| List.map devNavbarLink [ ( "home", "Home" ), ( "before-you-begin", "Before You Begin" ), ( "pet-info", "Pet Info" ), ( "location", "Location" ), ( "personality", "Personality" ), ( "likes", "Likes" ), ( "owner-info", "Owner Info" ), ( "thank-you", "Thank You" ) ]


navbarContent : Html Msg
navbarContent =
    ul [ class "flex ma0 bg-white w-100 pa2 justify-between items-center bb b--black-10 " ]
        [ li [ class "dib" ]
            [ img [ src "./assets/bx-logo.jpg", class "h3 w3 v-mid" ] [] ]
        ]
