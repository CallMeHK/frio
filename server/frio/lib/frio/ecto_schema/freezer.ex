defmodule Frio.Freezer do
  use Ecto.Schema
  import Ecto.Changeset

  alias Frio.Box

  schema "freezers" do
    field :name, :string

    timestamps()

    has_many(:boxes, Box)
  end

  def changeset(freezer, attrs) do
    freezer
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
