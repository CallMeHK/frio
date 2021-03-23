defmodule FrioGql.Schema.Comment do
  use Absinthe.Schema.Notation

  object :comment do
    field :id, :id
    field :text, :string
  end
end
