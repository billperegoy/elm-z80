module Initialize exposing (init)

import Array.Hamt as Array
import Model exposing (..)


init : ( Model, Cmd Msg )
init =
    { pc = 0
    , a = 2
    , f = 0
    , b = 8
    , c = 9
    , d = 11
    , e = 15
    , h = 17
    , l = 20
    , currentInstruction = 0
    , decodedInstruction = NOP
    , ram =
        Array.repeat 16384 0
            |> Array.set 0 0
            |> Array.set 1 65
            |> Array.set 2 66
            |> Array.set 3 67
            |> Array.set 4 68
            |> Array.set 5 69
            |> Array.set 6 72
            |> Array.set 7 73
            |> Array.set 8 76
            |> Array.set 9 77
            |> Array.set 10 80
            |> Array.set 11 6
            |> Array.set 12 56
            |> Array.set 13 14
            |> Array.set 14 43
            |> Array.set 15 128
            |> Array.set 16 130
            |> Array.set 17 129
            |> Array.set 18 5
            |> Array.set 19 5
            |> Array.set 20 5
            |> Array.set 21 5
            |> Array.set 22 5
            |> Array.set 23 5
            |> Array.set 24 5
            |> Array.set 25 5
            |> Array.set 26 5
            |> Array.set 27 5
            |> Array.set 28 5
            |> Array.set 29 5
            |> Array.set 30 12
            |> Array.set 31 12
            |> Array.set 32 12
            |> Array.set 33 12
            |> Array.set 34 12
            |> Array.set 35 118
    }
        ! []
