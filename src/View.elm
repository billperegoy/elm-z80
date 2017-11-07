module View exposing (view)

import Html exposing (..)
import Model exposing (..)


view : Model -> Html Msg
view model =
    h1 []
        [ text ("PC:  " ++ toString model.pc) ]
