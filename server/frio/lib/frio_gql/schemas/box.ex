defmodule FrioGql.Schema.Box do
  use Absinthe.Schema.Notation

  object :box do
    field :id, :id
    field :number, :integer
    field :capacity, :integer

    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime

    field :subboxes, list_of(:subbox) do
      resolve(&FrioGql.Resolvers.SubBox.box/2)
    end
 
  end
end
