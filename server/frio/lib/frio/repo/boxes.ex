defmodule Frio.Repo.Boxes do
  alias Frio.Box
  alias Frio.Repo
  import Ecto.Query

  def all do 
    Box
    |> Repo.all()
  end

  def insert(box) do
    %Box{} 
    |> Box.changeset(box) 
    |> Repo.insert()
  end

  def where(args) do
    query = from Box, where: ^args

    query
    |> Repo.all()
  end
end
