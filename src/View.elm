module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (..)


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ registerArray model
        ]


registerArray : Model -> Html Msg
registerArray model =
    div [ class "container" ]
        [ div [ class "row" ]
            [ div
                [ class "col-md-2 alert alert-secondary" ]
                [ text ("PC: " ++ toString model.pc) ]
            , div
                [ class "col-md-2 alert alert-secondary" ]
                [ text (toString model.decodedInstruction) ]
            ]
        , div [ class "row" ]
            [ div
                [ class "col-md-2 alert alert-secondary" ]
                [ text ("A: " ++ toString model.a) ]
            , div
                [ class "col-md-2 alert alert-secondary" ]
                [ text ("F: " ++ toString model.f) ]
            ]
        , div [ class "row" ]
            [ div
                [ class "col-md-2 alert alert-secondary" ]
                [ text ("B: " ++ toString model.b) ]
            , div
                [ class "col-md-2 alert alert-secondary" ]
                [ text ("C: " ++ toString model.c) ]
            ]
        , div [ class "row" ]
            [ div
                [ class "col-md-2 alert alert-secondary" ]
                [ text ("D: " ++ toString model.d) ]
            , div
                [ class "col-md-2 alert alert-secondary" ]
                [ text ("E: " ++ toString model.e) ]
            ]
        , div [ class "row" ]
            [ div
                [ class "col-md-2 alert alert-secondary" ]
                [ text ("H: " ++ toString model.h) ]
            , div
                [ class "col-md-2 alert alert-secondary" ]
                [ text ("L: " ++ toString model.l) ]
            ]
        ]
