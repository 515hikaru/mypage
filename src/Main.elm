-- Main.elm


module Main exposing (main)

import Browser
import Html exposing (Html, a, button, div, h1, text)
import Html.Attributes exposing (href)
import Html.Events exposing (onClick)



-- main


main =
    Browser.sandbox { init = init, update = update, view = view }



-- Model


type alias SocialMedia =
    { mediaName : String
    , userName : String
    , idPrefix : String
    , domain : String
    , userPagePath : String
    }


type alias Model =
    SocialMedia


twitter : Model
twitter =
    { mediaName = "Twitter", userName = "515hikaru", idPrefix = "@", domain = "twitter.com", userPagePath = "/515hikaru" }


gitHub : Model
gitHub =
    { mediaName = "GitHub", userName = "515hikaru", idPrefix = "@", domain = "github.com", userPagePath = "/515hikaru" }


hatena : Model
hatena =
    { mediaName = "Hatena", userName = "hikaru515", idPrefix = "id:", domain = "blog.515hikaru.net", userPagePath = "/about" }


qiita : Model
qiita =
    { mediaName = "Qiita", userName = "515hikaru", idPrefix = "@", domain = "qiita.com", userPagePath = "/515hikaru" }


techBlog : Model
techBlog =
    { mediaName = "I Was Perfect", userName = "515hikaru", idPrefix = "", domain = "tech.515hikaru.net", userPagePath = "/about" }


init : Model
init =
    twitter



-- Update


type Msg
    = Twitter
    | GitHub
    | Hatena
    | Qiita
    | TechBlog


update : Msg -> Model -> Model
update msg model =
    case msg of
        Twitter ->
            twitter

        GitHub ->
            gitHub

        Hatena ->
            hatena

        Qiita ->
            qiita

        TechBlog ->
            techBlog



-- View


userIdShow : Model -> String
userIdShow model =
    model.idPrefix ++ model.userName


makeAboutPageUrl : Model -> String
makeAboutPageUrl model =
    "https://" ++ model.domain ++ model.userPagePath


socialMediaInfo : Model -> Html Msg
socialMediaInfo model =
    div []
        [ a [ href <| makeAboutPageUrl model ] [ text <| model.mediaName ++ " " ++ userIdShow model ]
        ]


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ button [ onClick Twitter ] [ text "Twitter" ]
            , button [ onClick GitHub ] [ text "GitHub" ]
            , button [ onClick Hatena ] [ text "Hatena" ]
            , button [ onClick Qiita ] [ text "Qiita" ]
            , button [ onClick TechBlog ] [ text "I Was Perfect" ]
            ]
        , div
            []
            [ socialMediaInfo model ]
        ]
