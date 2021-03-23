defmodule FrioGql.Resolvers.Box do

  alias Frio.Repo.Boxes

  def all(_parent, _args, _resolution) do
    {:ok, Boxes.all()}
  end

  def freezer(_args, %{source: %{id: freezer_id} = _freezer} = _info),
    do: {:ok, Boxes.where(freezer_id: freezer_id)}

end
