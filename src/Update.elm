module Update exposing (update)

import Model exposing (..)
import Array.Hamt as Array
import Bitwise


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Cycle _ ->
            model
                |> fetch
                |> decode
                |> execute
                |> incrementPc
                |> noEffect


fetch : Model -> Model
fetch model =
    { model | currentInstruction = Array.get model.pc model.ram |> Maybe.withDefault 0 }


decode : Model -> Model
decode model =
    let
        topTwo =
            model.currentInstruction
                |> Bitwise.shiftRightBy 6

        srcReg =
            model.currentInstruction
                |> Bitwise.and 7

        destReg =
            model.currentInstruction
                |> Bitwise.shiftRightBy 3
                |> Bitwise.and 7
    in
        if model.currentInstruction == 0 then
            { model | decodedInstruction = Nop }
        else if topTwo == 1 then
            if (srcReg == 5) || (srcReg == 6) || (destReg == 5) || (destReg == 6) then
                { model | decodedInstruction = Nop }
            else
                { model | decodedInstruction = LD destReg srcReg }
        else
            { model | decodedInstruction = Nop }


execute : Model -> Model
execute model =
    model


incrementPc : Model -> Model
incrementPc model =
    { model | pc = model.pc + 1 }


noEffect : Model -> ( Model, Cmd Msg )
noEffect model =
    model ! []
