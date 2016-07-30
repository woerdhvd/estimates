module Main exposing (..)

import Html exposing (..)
import Html.App exposing (beginnerProgram)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Debug exposing (log)
import String
import Utils exposing (..)
import FormOption.Model exposing (..)


main =
    beginnerProgram
        { model = initmodel
        , update = update
        , view = view
        }



-- model

type alias Model =
    { formOptions : List FormOption
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
    | AddSubOption Id
    | RemoveOption Id
    | UpdateTitle Id String
    | UpdateCost Id String
    | UpdateDescription Id String
    | UpdateOrder Id OrderIndex
    | UpdateSubOptionLabel Id Id String


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddOption ->
            { model
                | formOptions = model.formOptions ++ [ FormOption model.uid 0 "" "" [] 0 ]
                , uid = model.uid + 1
            }

        AddSubOption id ->
            updateFormOptions (withId (addSubOption (SubOption model.uid "" 0)) id) model

        UpdateTitle id title ->
            updateFormOptions (withId (updateTitle title) id) model

        UpdateCost id cost ->
            updateFormOptions (withId (updateCost <| toCost cost) id) model

        UpdateDescription id description ->
            updateFormOptions (withId (updateDescription description) id) model

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
        , formOptions model.formOptions
        ]


css href =
    node "link" [ rel "stylesheet", Html.Attributes.href href ] []


formOptions formOptions =
    ul [ id "form-options" ]
        (List.map option formOptions ++ [ addOption ])


option option =
    li [ class "form-option" ]
        [ input
            [ class "title"
            , value option.title
            , placeholder "Feature"
            , onInput (UpdateTitle (option.id))
            ]
            []
        , input
            [ class "cost"
            , value
                (if option.cost == 0 then
                    ""
                 else
                    "€" ++ toString option.cost
                )
            , placeholder "Prijs"
            , onInput (UpdateCost (option.id))
            ]
            []
        , button [ class "remove", onClick (RemoveOption option.id) ] [ text "-" ]
        , button [ class "add-suboption", onClick (AddSubOption option.id) ] [ text "+" ]
        , textarea
            [ class "description"
            , value option.description
            , placeholder "Beschrijving"
            , onInput (UpdateDescription (option.id))
            ]
            []
        , subOptions option.subOptions option.id
        ]


subOptions subOptions id =
    ul [ class "sub-options" ]
        (List.map (subOption id) subOptions)


subOption id subOption =
    li [ class "sub-option" ]
        [ input
            [ value <| log "label" subOption.label
            , placeholder "Optie"
            , onInput (UpdateSubOptionLabel id subOption.id)
            ]
            []
        ]


addOption =
    div [ class "add-form-option", onClick (AddOption) ]
        [ text "+" ]
