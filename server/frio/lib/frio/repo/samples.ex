defmodule Frio.Repo.Samples do
  alias Frio.Sample
  alias Frio.Repo
  import Ecto.Query

  def all do 
    Sample
    |> Repo.all()
  end

  def insert(sample) do
    %Sample{} 
    |> Sample.changeset(sample) 
    |> Repo.insert()
  end

  def where(args) do
    query = from Sample, where: ^args

    query
    |> Repo.all()
  end

  def create(args) do
    Frio.Repo.Samples.insert(args)
  end

  def update(id, args) do
    Sample
    |> Repo.get(id)
    |> Sample.changeset(args) 
    |> Repo.update()
  end

end
