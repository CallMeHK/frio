defmodule Frio.Rack do
  use Ecto.Schema
  import Ecto.Changeset

  alias Frio.Box
  alias Frio.Freezer

  schema "racks" do
    field :number, :integer
    field :capacity, :integer

    timestamps()

    has_many(:boxes, Box)
    belongs_to(:freezer, Freezer, foreign_key: :freezer_id)
  end

  def changeset(box, attrs) do
    box
    |> cast(attrs, [:number, :capacity, :freezer_id])
    |> validate_required([:number, :capacity, :freezer_id])
  end
end
