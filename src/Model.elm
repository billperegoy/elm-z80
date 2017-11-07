module Model exposing (..)

import Time
import Array.Hamt


type alias Reg8 =
    Int


type alias Reg16 =
    Int


type alias Model =
    { pc : Reg16
    , a : Reg8
    , f : Reg8
    , b : Reg8
    , c : Reg8
    , d : Reg8
    , e : Reg8
    , h : Reg8
    , l :
        Reg8
    , ram : Array.Hamt.Array Int
    }


type Msg
    = Cycle Time.Time
