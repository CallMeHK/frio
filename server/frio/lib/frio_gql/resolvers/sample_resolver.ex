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

  def subbox(_args, %{source: %{id: sub_box_id} = _box} = _info),
    do: {:ok, Samples.where(sub_box_id: sub_box_id)}

end
