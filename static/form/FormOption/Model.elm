module FormOption.Model exposing (..)


type alias Id =
    Int

type alias OrderIndex =
    Int

type alias Model =
  { id : Id
  , orderIndex : OrderIndex
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

new : Id -> Model
new id =
  Model id 0 "" "" [] 0
