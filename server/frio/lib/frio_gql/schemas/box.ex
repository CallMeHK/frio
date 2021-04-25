defmodule FrioGql.Schema.Box do
  use Absinthe.Schema.Notation

  object :box do
    field :id, :id
    field :number, :integer
    field :capacity, :integer
    field :rack_id, :integer
    field :rack_position, :integer
    field :rows, :integer
    field :columns, :integer

    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime

    field :samples, list_of(:sample) do
      resolve(&FrioGql.Resolvers.Sample.box/2)
    end
   end
end
