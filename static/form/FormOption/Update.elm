module FormOption.Update exposing (..)

import FormOption.Model exposing (..)
import Utils exposing (toCost)

type Msg
  = UpdateTitle String
  | UpdateCost String
  | UpdateDescription String
  | AddSubOption

update : Msg -> Model -> Model
update msg formoption =
  case msg of
    UpdateTitle title ->
      { formoption | title = title }

    UpdateCost cost ->
      { formoption | cost = toCost cost }

    UpdateDescription description ->
      { formoption | description = description }

    _ ->
      formoption
