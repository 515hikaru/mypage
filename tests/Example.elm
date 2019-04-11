module Example exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Main exposing (twitter)
import Test exposing (..)


suite : Test
suite =
    describe "foo"
        [ test "bar" <|
            \_ ->
                twitter.mediaName
                    |> Expect.equal "Twitter"
        ]
