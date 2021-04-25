defmodule FrioGql.Resolvers.Rack do

  alias Frio.Repo.Racks

  def all(_parent, _args, _resolution) do
    {:ok, Racks.all()}
  end

  def freezer(_args, %{source: %{id: freezer_id} = _freezer} = _info),
    do: {:ok, Racks.where(freezer_id: freezer_id)}

end
