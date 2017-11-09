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
        , h3 []
            [ text ("A: " ++ toString model.a) ]
        , h3 []
            [ text ("B: " ++ toString model.b) ]
        , h3 []
            [ text ("C: " ++ toString model.c) ]
        , h3 []
            [ text ("D: " ++ toString model.d) ]
        , h3 []
            [ text ("E: " ++ toString model.e) ]
        , h3 []
            [ text ("H: " ++ toString model.h) ]
        , h3 []
            [ text ("L: " ++ toString model.l) ]
        ]
