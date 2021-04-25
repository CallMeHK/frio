defmodule FrioGql.Schema.Rack do
  use Absinthe.Schema.Notation

  object :rack do
    field :id, :id
    field :number, :integer
    field :capacity, :integer

    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime

    field :boxes, list_of(:box) do
      resolve(&FrioGql.Resolvers.Box.rack/2)
    end
 
  end
end
