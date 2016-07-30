module FormOption.Model exposing (..)


type alias Id =
    Int

type alias OrderIndex =
    Int

type alias FormOption =
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
