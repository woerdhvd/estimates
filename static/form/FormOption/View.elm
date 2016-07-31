module FormOption.View exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import FormOption.Model exposing (Model)
import FormOption.Update exposing (..)

formOption : Model -> Html Msg
formOption formOption =
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
      -- , button [ class "remove", onClick (RemoveOption option.id) ] [ text "-" ]
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


formOptions formOptions =
    ul [ id "form-options" ]
        (List.map option formOptions ++ [ addOption ])



subOptions subOptions id =
    ul [ class "sub-options" ]
        (List.map (subOption id) subOptions)


subOption id subOption =
    li [ class "sub-option" ]
        [ input
            [ value subOption.label
            , placeholder "Optie"
            ]
            []
        ]

addOption =
    div [ class "add-form-option", onClick (AddOption) ]
        [ text "+" ]
