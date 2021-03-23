defmodule Frio.Box do
  use Ecto.Schema
  import Ecto.Changeset

  alias Frio.SubBox
  alias Frio.Freezer

  schema "boxes" do
    field :number, :integer
    field :capacity, :integer

    timestamps()

    has_many(:subboxes, SubBox)
    belongs_to(:freezer, Freezer, foreign_key: :freezer_id)
  end

  def changeset(box, attrs) do
    box
    |> cast(attrs, [:number, :capacity, :freezer_id])
    |> validate_required([:number, :capacity, :freezer_id])
  end
end
