defmodule Frio.Repo.Racks do
  alias Frio.Rack
  alias Frio.Repo
  import Ecto.Query

  def all do 
    Rack
    |> Repo.all()
  end

  def where(args) do
    query = from Rack, where: ^args

    query
    |> Repo.all()
  end

  def get_by_id(id) do
    Rack
    |> Repo.one(id: id)
  end

  def insert(box) do
    %Rack{} 
    |> Rack.changeset(box) 
    |> Repo.insert()
  end
end
