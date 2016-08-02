module Main exposing (..)

import TimeTravel.Html.App exposing (program)
import Html exposing (..)
import Html.App
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Dict exposing (Dict)
import Debug exposing (log)
import String
import FormOption
import Requests exposing (getFormOptions)
import Http

main =
  program
    { init = init
    , update = update
    , view = view
    , subscriptions = \_ -> Sub.none
    }

type alias Id = Int

type alias Model =
  { formOptions : Dict Id FormOption.Model
  , uid : Id
  }


init : (Model, Cmd Msg)
init =
  (Model Dict.empty 0) ! [getFormOptions FetchFail FetchSuccess ]



-- UPDATE
type Msg
  = NoOp
  | Fetch
  | FetchSuccess (List FormOption.Model)
  | FetchFail Http.Error
  | Save
  | AddOption
  | UpdateOption Id FormOption.Msg
  -- | UpdateOrder Id OrderIndex

toDict : List a -> Dict Int a
toDict list =
  List.indexedMap (,) list
  |> Dict.fromList

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
      AddOption ->
        { model
            | formOptions = Dict.insert model.uid FormOption.new model.formOptions
            , uid = model.uid + 1
        } ! []

      UpdateOption id subMsg ->
        case subMsg of
          FormOption.Remove ->
            { model | formOptions = Dict.remove id model.formOptions } ! []
          _ ->
            { model | formOptions = Dict.update id (Maybe.map <| FormOption.update subMsg) model.formOptions } ! []

      FetchSuccess formOptions ->
        { model | formOptions = log "hello" <| toDict formOptions
        , uid = List.length formOptions
        } ! []

      _ ->
        model ! []



-- VIEW
view : Model -> Html Msg
view model =
  Html.form [ onSubmit NoOp ]
      [ css "static/styles/form.css"
      , css "static/styles/fonts.css"
      , h1 [] [ text "Aanvraag prijsopgave website" ]
      , formOptionList <| Dict.toList model.formOptions
      , pre [] [ text <| toString model ]
      ]

formOptionList formOptions =
  ul [ id "form-options" ]
    (List.map viewFormOption formOptions ++ [addOption])

viewFormOption (id, model) =
  Html.App.map (UpdateOption id) (FormOption.formOption model)

addOption =
    div [ class "add-form-option", onClick AddOption ]
        [ text "+" ]

css href =
    node "link" [ rel "stylesheet", Html.Attributes.href href ] []

asMaybe : (v -> v) -> Maybe v -> Maybe v
asMaybe fn v =
  Maybe.map fn v
