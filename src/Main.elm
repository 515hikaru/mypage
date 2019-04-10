-- Main.elm


module Main exposing (main)

import Browser
import Html exposing (Html, a, button, div, h2, p, text)
import Html.Attributes exposing (class, href)
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
    , description : String
    }


type alias Model =
    SocialMedia


twitter : Model
twitter =
    { mediaName = "Twitter"
    , userName = "515hikaru"
    , idPrefix = "@"
    , domain = "twitter.com"
    , userPagePath = "/515hikaru"
    , description = "言わずとしれた巨大SNS。だいだい毎日何かはつぶやいている。"
    }


gitHub : Model
gitHub =
    { mediaName = "GitHub"
    , userName = "515hikaru"
    , idPrefix = "@"
    , domain = "github.com"
    , userPagePath = "/515hikaru"
    , description = "個人開発用アカウント。悲しいことに特に代表作はない。自分用ツールを作っては消している。"
    }


hatena : Model
hatena =
    { mediaName = "Hatena"
    , userName = "hikaru515"
    , idPrefix = "id:"
    , domain = "blog.515hikaru.net"
    , userPagePath = "/about"
    , description = "個人ブログ。以前は技術の話や数学の話を書いていたが、最近はお気持ちを綴っていることが多い。"
    }


qiita : Model
qiita =
    { mediaName = "Qiita"
    , userName = "515hikaru"
    , idPrefix = "@"
    , domain = "qiita.com"
    , userPagePath = "/515hikaru"
    , description = "あんまり使っていないが一応。需要あるかもな、と思ったらたまに書く。"
    }


techBlog : Model
techBlog =
    { mediaName = "I Was Perfect"
    , userName = ""
    , idPrefix = ""
    , domain = "tech.515hikaru.net"
    , userPagePath = "/about"
    , description = "技術メモ。完成度を気にしないでメモ書きをするときに使っている。"
    }


noteMu : Model
noteMu =
    { mediaName = "note"
    , userName = "515hikaru"
    , idPrefix = ""
    , domain = "note.mu"
    , userPagePath = "/515hikaru"
    , description = "一応試してみた。現在は書きたい記事がなく停滞気味。"
    }


init : Model
init =
    twitter



-- Update


type Msg
    = Activate Model


update : Msg -> Model -> Model
update msg model =
    case msg of
        Activate newModel ->
            newModel



-- View


userIdShow : Model -> String
userIdShow model =
    model.idPrefix ++ model.userName


makeAboutPageUrl : Model -> String
makeAboutPageUrl model =
    "https://" ++ model.domain ++ model.userPagePath


socialMediaInfo : Model -> Html Msg
socialMediaInfo model =
    div [ class "info" ]
        [ div [ class "info-header" ]
            [ h2 []
                [ a [ href <| makeAboutPageUrl model ] [ text model.mediaName ] ]
            , p [] [ text <| userIdShow model ]
            ]
        , p [ class "info-description" ] [ text model.description ]
        ]


view : Model -> Html Msg
view model =
    div [ class "social" ]
        [ div
            [ class "social-buttons" ]
          <|
            List.map
                (\x ->
                    div
                        [ class "social-button" ]
                        [ div [ onClick <| Activate x ] [ text x.mediaName ] ]
                )
                [ twitter, gitHub, hatena, qiita, noteMu ]
        , div
            [ class "social-info" ]
            [ socialMediaInfo model ]
        ]
