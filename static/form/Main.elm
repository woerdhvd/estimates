module Main exposing (..)

import Html exposing (..)
import Html.App exposing (beginnerProgram)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Utils exposing (..)
import Dict exposing (Dict)
import FormOption


main =
  beginnerProgram
    { model = initmodel
    , update = update
    , view = view
    }



-- MODEL
type alias Id = Int

type alias Model =
  { formOptions : Dict Id FormOption.Model
  , uid : Id
  }


initmodel : Model
initmodel =
  Model Dict.empty 0



-- UPDATE
type Msg
    = NoOp
    | Fetch
    | Save
    | AddOption
    | UpdateOption Id FormOption.Msg
    -- | UpdateOrder Id OrderIndex


update : Msg -> Model -> Model
update msg model =
    case msg of
      AddOption ->
        { model
            | formOptions = Dict.insert model.uid FormOption.new model.formOptions
            , uid = model.uid + 1
        }

      UpdateOption id subMsg ->
        case subMsg of
          FormOption.Remove ->
            { model | formOptions = Dict.remove id model.formOptions }
          _ ->
            { model | formOptions = Dict.update id (Maybe.map <| FormOption.update subMsg) model.formOptions }

      _ ->
        model



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
