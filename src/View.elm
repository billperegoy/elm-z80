module View exposing (view)

import Html exposing (..)
import Model exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ h1 []
            [ text ("PC:  " ++ toString model.pc) ]
        , h1
            []
            [ text ("Instr: " ++ toString model.currentInstruction) ]
        , h1
            []
            [ text ("Instr: " ++ toString model.decodedInstruction) ]
        ]
