defmodule Frio.SubBox do
  use Ecto.Schema
  import Ecto.Changeset

  alias Frio.Box
  alias Frio.Sample

  schema "subboxes" do
    field :number, :integer
    field :capacity, :integer

    timestamps()

    belongs_to(:box, Box, foreign_key: :box_id)
    has_many(:samples, Sample)
  end

  def changeset(subbox, attrs) do
    subbox
    |> cast(attrs, [:number, :capacity, :box_id])
    |> validate_required([:number, :capacity, :box_id])
  end
end
