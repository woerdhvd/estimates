module FormOption exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Utils exposing (toCost, costInput, uid)

-- MODEL
type alias Id = Int
type alias OrderIndex = Int

type alias Model =
  { orderIndex : OrderIndex
  , title : String
  , description : String
  , subOptions : List SubOption
  , cost : Float
  , uid : Int
  }

type alias SubOption =
  { id : Id
  , label : String
  , cost : Float
  }

new : Model
new =
  Model 0 "" "" [] 0 0

-- UPDATE
type Msg
  = UpdateTitle String
  | UpdateCost String
  | UpdateDescription String
  | AddSubOption
  | Remove

update : Msg -> Model -> Model
update msg model =
  case msg of
    UpdateTitle title ->
      { model | title = title }

    UpdateCost cost ->
      { model | cost = toCost cost }

    UpdateDescription description ->
      { model | description = description }

    AddSubOption ->
      { model | subOptions = model.subOptions ++ [SubOption model.uid "" 0]
      , uid = model.uid + 1
      }

    _ ->
      model


-- VIEW
formOption formOption =
  li [ class "form-option" ]
      [ input
          [ class "title"
          , value formOption.title
          , placeholder "Feature"
          , onInput UpdateTitle
          ]
          []
      , input
          [ class "cost"
          , value <| costInput formOption.cost
          , placeholder "Prijs"
          , onInput UpdateCost
          ]
          []
      , button [ class "remove", onClick Remove ] [ text "-" ]
      , button [ class "add-suboption", onClick AddSubOption ] [ text "+" ]
      , textarea
          [ class "description"
          , value formOption.description
          , placeholder "Beschrijving"
          , onInput UpdateDescription
          ]
          []
      , subOptionList formOption.subOptions
      ]

subOptionList subOptions =
    ul [ class "sub-options" ]
        (List.map subOption subOptions)


subOption subOption =
    li [ class "sub-option" ]
        [ input
            [ value subOption.label
            , placeholder "Optie"
            ]
            []
        ]
