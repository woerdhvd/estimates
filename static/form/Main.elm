module Main exposing (..)

import Html exposing (..)
import Html.App exposing (beginnerProgram)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Debug exposing (log)
import String
import Utils exposing (..)
import FormOption.Model
import FormOption.View


main =
    beginnerProgram
        { model = initmodel
        , update = update
        , view = view
        }



-- model

type alias Model =
    { formOptions : List FormOption.Model.Model
    , uid : Int
    }


initmodel : Model
initmodel =
    Model [] 0



-- update


type Msg
    = NoOp
    | Fetch
    | Save
    | AddOption
    | RemoveOption Int
    -- | UpdateOrder Id OrderIndex


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddOption ->
          { model
              | formOptions = model.formOptions ++ [ FormOption.Model.new model.uid  ]
              , uid = model.uid + 1
          }

        RemoveOption id ->
          updateFormOptions (removeWithId id) model

        _ ->
            model



-- view


view : Model -> Html Msg
view model =
    Html.form [ onSubmit NoOp ]
        [ css "static/styles/form.css"
        , css "static/styles/fonts.css"
        , h1 [] [ text "Aanvraag prijsopgave website" ]
        , FormOption.View.formOptions model.formOptions
        ]


css href =
    node "link" [ rel "stylesheet", Html.Attributes.href href ] []
