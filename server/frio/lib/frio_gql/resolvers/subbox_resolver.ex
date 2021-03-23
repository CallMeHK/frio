defmodule FrioGql.Resolvers.SubBox do

  alias Frio.Repo.SubBoxes

  def all(_parent, _args, _resolution) do
    {:ok, SubBoxes.all()}
  end

  def box(_args, %{source: %{id: box_id} = _box} = _info),
    do: {:ok, SubBoxes.where(box_id: box_id)}

end
