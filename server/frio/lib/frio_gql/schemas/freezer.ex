defmodule FrioGql.Schema.Freezer do
  use Absinthe.Schema.Notation

  object :freezer do
    field :id, :id
    field :name, :string

    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime

    field :racks, list_of(:rack) do
      resolve(&FrioGql.Resolvers.Rack.freezer/2)
    end
  end
end
