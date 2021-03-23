defmodule FrioGql.Resolvers.Freezer do

  alias Frio.Repo.Freezers

  def all(_parent, _args, _resolution) do
    {:ok, Freezers.all()}
  end
end

