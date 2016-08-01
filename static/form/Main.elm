module Main exposing (..)

import Html exposing (..)
import Html.App exposing (beginnerProgram)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Utils exposing (..)
import Dict
import FormOption


main =
    beginnerProgram
        { model = initmodel
        , update = update
        , view = view
        }



-- MODEL
type alias Id = Int

type alias IndexedFormOption =
  { id : Id
  , model : FormOption.Model
  }

type alias Model =
  { formOptions : List IndexedFormOption
  , uid : Id
  }


initmodel : Model
initmodel =
  Model [] 0



-- UPDATE
type Msg
    = NoOp
    | Fetch
    | Save
    | AddOption
    | RemoveOption Id
    | UpdateOption Id FormOption.Msg
    -- | UpdateOrder Id OrderIndex


update : Msg -> Model -> Model
update msg model =
    case msg of
      AddOption ->
        { model
            | formOptions = model.formOptions ++ [ IndexedFormOption model.uid FormOption.new ]
            , uid = model.uid + 1
        }

      RemoveOption id ->
        { model | formOptions = removeWithId id model.formOptions }

      -- FIXME
      UpdateOption id subMsg ->
        case subMsg of
          FormOption.Remove ->
            { model | formOptions = removeWithId id model.formOptions }
          _ ->
            { model | formOptions = updateWithId id (FormOption.update subMsg) model.formOptions}

      _ ->
        model


-- VIEW
view : Model -> Html Msg
view model =
  Html.form [ onSubmit NoOp ]
      [ css "static/styles/form.css"
      , css "static/styles/fonts.css"
      , h1 [] [ text "Aanvraag prijsopgave website" ]
      , formOptionList model.formOptions
      , pre [] [ text <| toString model ]
      ]

formOptionList formOptions =
  ul [ id "form-options" ]
    (List.map viewFormOption formOptions ++ [addOption])

viewFormOption {id, model} =
  Html.App.map (UpdateOption id) (FormOption.formOption (RemoveOption id) model)

addOption =
    div [ class "add-form-option", onClick AddOption ]
        [ text "+" ]

css href =
    node "link" [ rel "stylesheet", Html.Attributes.href href ] []
