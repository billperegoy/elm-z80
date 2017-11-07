module Initialize exposing (init)

import Array.Hamt
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
    , l =
        0
    , ram = Array.Hamt.repeat 16384 0
    }
        ! []
