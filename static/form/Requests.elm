module Requests exposing (..)

import Http
import Json.Decode as Json exposing ((:=))
import Task exposing (..)
import FormOption exposing (Model, SubOption)

getFormOptions failMsg succeedMsg =
  Http.get formOptions  "/estimates/api/formoptions"
  |> Task.perform failMsg succeedMsg

formOptions =
  Json.list formOption

formOption =
  Json.object6 FormOption.Model
    ("orderIndex"  := Json.int)
    ("title"       := Json.string)
    ("description" := Json.string)
    ("subOptions"  := Json.list subOption)
    ("cost"        := Json.float)
    ("uid"         := Json.int)

subOption =
  Json.object3 FormOption.SubOption
    ("id"    := Json.int)
    ("label" := Json.string)
    ("cost"  := Json.float)
