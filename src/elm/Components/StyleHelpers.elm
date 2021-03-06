module Components.StyleHelpers exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (Msg)


headlineFont : String
headlineFont =
    "f3 fw6"


bodyFont : String
bodyFont =
    "f4 lh-copy fw3"


checkboxFont : String
checkboxFont =
    "f5 lh-copy fw3"


topicButtonFont : String
topicButtonFont =
    "f3 fw3"


roleButtonFont : String
roleButtonFont =
    "f4 fw3"


inputLabelFont : String
inputLabelFont =
    "fw5 f4"


inputFont : String
inputFont =
    "fw3 f4"


submitButtonStyle : String
submitButtonStyle =
    "pointer bn br2 pv3 ph3 w5 white"


textareaFont : String
textareaFont =
    "f5 lh-copy black"


navLinkFont : String
navLinkFont =
    "black f4"


navLinkStyle : String
navLinkStyle =
    "link pointer"


buttonStyle : String
buttonStyle =
    "pointer bn br2 pv3 ph3"


classes : List String -> Html.Attribute msg
classes classList =
    String.join " " classList
        |> class


emptyDiv : Html msg
emptyDiv =
    div [ class "dn" ] []


defaultOption : Html msg
defaultOption =
    option [ selected True, disabled True ] [ text "Please select one" ]


displayElement : Bool -> String
displayElement bool =
    if bool then
        ""
    else
        "dn"


backgroundImageStyle : String -> Int -> Attribute Msg
backgroundImageStyle url sizePercent =
    style [ ( "background-image", "url(" ++ url ++ ")" ), ( "background-repeat", "no-repeat" ), ( "background-position", "center center" ), ( "background-size", toString sizePercent ++ "%" ) ]
