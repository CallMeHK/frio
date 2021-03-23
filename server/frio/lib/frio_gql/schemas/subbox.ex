defmodule FrioGql.Schema.SubBox do
  use Absinthe.Schema.Notation

  object :subbox do
    field :id, :id
    field :number, :integer
    field :capacity, :integer
    field :box_id, :integer

    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime

    field :samples, list_of(:sample) do
      resolve(&FrioGql.Resolvers.Sample.subbox/2)
    end
   end
end
