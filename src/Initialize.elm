module Initialize exposing (init)

import Array.Hamt as Array
import Model exposing (..)


init : ( Model, Cmd Msg )
init =
    { pc = 0
    , a = 0
    , f = 0
    , b = 0
    , c = 0
    , d = 0
    , e = 0
    , h = 0
    , l = 0
    , currentInstruction = 0
    , decodedInstruction = Nop
    , ram =
        Array.repeat 16384 0
            |> Array.set 0 0
            |> Array.set 1 65
            |> Array.set 2 72
    }
        ! []
