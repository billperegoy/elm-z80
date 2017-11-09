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

        registerLoadInstruction =
            topTwo == 1

        srcReg =
            model.currentInstruction
                |> Bitwise.and 7
                |> toReg

        destReg =
            model.currentInstruction
                |> Bitwise.shiftRightBy 3
                |> Bitwise.and 7
                |> toReg
    in
        if model.currentInstruction == 0 then
            { model | decodedInstruction = Nop }
        else if registerLoadInstruction then
            case ( srcReg, destReg ) of
                ( Nothing, _ ) ->
                    { model | decodedInstruction = Nop }

                ( _, Nothing ) ->
                    { model | decodedInstruction = Nop }

                ( Just dest, Just src ) ->
                    { model | decodedInstruction = LD dest src }
        else
            { model | decodedInstruction = Nop }


execute : Model -> Model
execute model =
    case model.decodedInstruction of
        Nop ->
            model

        LD dest src ->
            let
                srcVal =
                    getRegContents src model
            in
                setRegContents dest srcVal model


incrementPc : Model -> Model
incrementPc model =
    { model | pc = model.pc + 1 }


noEffect : Model -> ( Model, Cmd Msg )
noEffect model =
    model ! []


toReg : Int -> Maybe Register
toReg val =
    case val of
        0 ->
            Just B

        1 ->
            Just C

        2 ->
            Just D

        3 ->
            Just E

        4 ->
            Just H

        5 ->
            Just L

        _ ->
            Nothing


getRegContents : Register -> Model -> Int
getRegContents reg model =
    case reg of
        A ->
            model.a

        B ->
            model.b

        C ->
            model.c

        D ->
            model.d

        E ->
            model.e

        H ->
            model.h

        L ->
            model.l


setRegContents : Register -> Int -> Model -> Model
setRegContents reg value model =
    case reg of
        A ->
            { model | a = value }

        B ->
            { model | b = value }

        C ->
            { model | c = value }

        D ->
            { model | d = value }

        E ->
            { model | e = value }

        H ->
            { model | h = value }

        L ->
            { model | l = value }
