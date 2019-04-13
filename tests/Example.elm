module Example exposing (suite, suiteConvertPropertyName)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Main exposing (..)
import Test exposing (..)


suiteConvertPropertyName : Test
suiteConvertPropertyName =
    describe "toLower and remove splited whitespace"
        [ test "Twitter convert to twitter" <|
            \_ ->
                let
                    s =
                        convertPropertyName "Twitter"
                in
                s |> Expect.equal "twitter"
        , test "I Was Perfect convert to i-was-perfect" <|
            \_ ->
                let
                    s =
                        convertPropertyName "I Was Perfect"
                in
                s |> Expect.equal "i-was-perfect"
        , fuzz string "string have no whitespaces" <|
            \randomString ->
                let
                    propertyName =
                        convertPropertyName randomString
                in
                Expect.true "It has no whitespaces" <|
                    not (String.contains " " propertyName)
        , fuzz string "string have no camel cases" <|
            \randomString ->
                let
                    propertyName =
                        convertPropertyName randomString
                in
                propertyName
                    |> Expect.equal
                        (String.toLower
                            propertyName
                        )
        ]
