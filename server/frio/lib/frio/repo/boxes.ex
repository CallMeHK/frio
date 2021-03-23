defmodule Frio.Repo.Boxes do
  alias Frio.Box
  alias Frio.Repo
  import Ecto.Query

  def all do 
    Box
    |> Repo.all()
  end

  def where(args) do
    query = from Box, where: ^args

    query
    |> Repo.all()
  end

  def get_by_id(id) do
    Box
    |> Repo.one(id: id)
  end

  def insert(box) do
    %Box{} 
    |> Box.changeset(box) 
    |> Repo.insert()
  end
end
