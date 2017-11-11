module Subscriptions exposing (subscriptions)

import Model exposing (..)
import Time


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch [ Time.every (1000 * Time.millisecond) Cycle ]
