defmodule FrioGql.Resolvers.Box do

  alias Frio.Repo.Boxes

  def all(_parent, _args, _resolution) do
    {:ok, Boxes.all()}
  end

  def rack(_args, %{source: %{id: rack_id} = _rack} = _info),
    do: {:ok, Boxes.where(rack_id: rack_id)}

end
