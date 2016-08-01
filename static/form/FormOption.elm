module FormOption exposing (..)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Utils exposing (toCost, costInput)

-- MODEL
type alias Id = Int
type alias OrderIndex = Int

type alias Model =
  { orderIndex : OrderIndex
  , title : String
  , description : String
  , subOptions : List SubOption
  , cost : Float
  }

type alias SubOption =
  { id : Id
  , label : String
  , cost : Int
  }

new : Model
new =
  Model 0 "" "" [] 0

-- UPDATE
type Msg
  = UpdateTitle String
  | UpdateCost String
  | UpdateDescription String
  | AddSubOption
  | Remove

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

type alias Context super =
  { remove : super
  }

-- VIEW
formOption context formOption =
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
