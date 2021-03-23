defmodule FrioGql.Schema.Freezer do
  use Absinthe.Schema.Notation

  object :freezer do
    field :id, :id
    field :name, :string

    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime

    field :boxes, list_of(:box) do
      resolve(&FrioGql.Resolvers.Box.freezer/2)
    end
  end
end
