module Initialize exposing (init)

import Array.Hamt as Array
import Model exposing (..)


init : ( Model, Cmd Msg )
init =
    { pc = 0
    , a = 2
    , f = 5
    , b = 8
    , c = 9
    , d = 11
    , e = 15
    , h = 17
    , l = 20
    , currentInstruction = 0
    , decodedInstruction = Nop
    , ram =
        Array.repeat 16384 0
            |> Array.set 0 0
            |> Array.set 1 65
            |> Array.set 2 66
            |> Array.set 3 67
            |> Array.set 4 68
            |> Array.set 5 69
            |> Array.set 6 70
            |> Array.set 7 71
            |> Array.set 8 72
    }
        ! []
