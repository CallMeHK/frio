defmodule Frio.Repo.Freezers do
  alias Frio.Freezer
  alias Frio.Repo

  def all do 
    Freezer
    |> Repo.all()
  end

  def insert(freezer) do
    %Freezer{} 
    |> Freezer.changeset(freezer) 
    |> Repo.insert()
  end
end
