defmodule Frio.Repo.SubBoxes do
  alias Frio.SubBox
  alias Frio.Repo
  import Ecto.Query

  def all do 
    SubBox
    |> Repo.all()
  end

  def insert(subbox) do
    %SubBox{} 
    |> SubBox.changeset(subbox) 
    |> Repo.insert()
  end

  def where(args) do
    query = from SubBox, where: ^args

    query
    |> Repo.all()
  end
end
