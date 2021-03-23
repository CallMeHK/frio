defmodule FrioGql.Resolvers.Comment do

  def all(_parent, _args, _resolution) do
    {:ok, [ %{id: 1, text: "yeye"}, %{id: 2, text: "sdfwef"}, %{id: 3, text: "ty is cool"} ]}
  end

end

