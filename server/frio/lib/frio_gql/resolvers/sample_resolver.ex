defmodule FrioGql.Resolvers.Sample do

  alias Frio.Repo.Samples

  def all(_parent, _args, _resolution) do
    {:ok, Samples.all()}
  end

  def create(_parent, args, _resolution), do: Samples.create(args)

  def update(_parent, args, _resolution) do
    {id, updates} = Map.pop(args, :id)
    Samples.update(id, updates)
  end

  def box(_args, %{source: %{id: box_id} = _box} = _info),
    do: {:ok, Samples.where(box_id: box_id)}

end
