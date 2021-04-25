defmodule Frio.Box do
  use Ecto.Schema
  import Ecto.Changeset

  alias Frio.Rack
  alias Frio.Sample

  schema "boxes" do
    field :number, :integer
    field :capacity, :integer
    field :rack_position, :integer
    field :rows, :integer
    field :columns, :integer

    timestamps()

    belongs_to(:rack, Rack, foreign_key: :rack_id)
    has_many(:samples, Sample)
  end

  def changeset(box, attrs) do
    box
    |> cast(attrs, [:number, :capacity, :rack_id, :rows, :columns, :rack_position])
    |> validate_required([:number, :capacity, :rack_id])
  end
end
