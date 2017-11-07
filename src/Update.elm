module Update exposing (update)

import Model exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Cycle _ ->
            model
                |> incrementPc
                |> noEffect


incrementPc : Model -> Model
incrementPc model =
    { model | pc = model.pc + 1 }


noEffect : Model -> ( Model, Cmd Msg )
noEffect model =
    model ! []
