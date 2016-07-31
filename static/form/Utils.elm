module Utils exposing (..)

import Result
import String

type alias WithId =
  { id : Int }

-- decorators
applyIfId fn id item =
  if item.id == id then
    fn item
  else
    item

-- list
withId fn id list =
  list
  |> List.map (applyIfId fn id)

removeWithId id list =
  List.filter (\item -> item.id /= id) list


-- record updates
updateTitle newTitle record =
  { record | title = newTitle }

updateDescription newDescription record =
  { record | description = newDescription }

updateCost newCost record =
  { record | cost = newCost }

updateLabel newLabel record =
  { record | label = newLabel }

updateFormOptions fn model =
  { model | formOptions = fn model.formOptions }

addSubOption subOption record =
  { record | subOptions = record.subOptions ++ [subOption]}


updateById fn optionId model =
  { model | formOptions = withId fn optionId model.formOptions}

-- string
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
