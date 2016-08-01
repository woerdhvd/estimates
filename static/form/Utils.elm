module Utils exposing (..)

import Result
import String

-- UPDATE HELPERS
applyIfId id fn item =
  if item.id == id then
    { item | model = fn item.model }
  else
    item

-- list
updateWithId id fn list =
  List.map (applyIfId id fn) list

removeWithId id list =
  List.filter (\item -> item.id /= id) list

-- COST
toCost string =
  if (String.length string) == 0 then
    0
  else if (String.length string) == 1 then
    Result.withDefault 0 <| String.toFloat string
  else
    Result.withDefault 0 <| String.toFloat <| String.dropLeft 1 string

costInput cost =
  if cost == 0 then
    ""
  else
    "€" ++ toString cost


-- UID
uid : List {id : Int} -> Int
uid list =
  if List.length list > 0 then
    1
  else
    0
