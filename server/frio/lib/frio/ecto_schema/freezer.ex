defmodule Frio.Freezer do
  use Ecto.Schema
  import Ecto.Changeset

  alias Frio.Rack

  schema "freezers" do
    field :name, :string

    timestamps()

    has_many(:racks, Rack)
  end

  def changeset(freezer, attrs) do
    freezer
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
