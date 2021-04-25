defmodule Frio.Sample do
  use Ecto.Schema
  import Ecto.Changeset

  alias Frio.Box

  schema "samples" do
    field :number, :integer
    field :name, :string
    field :cell_count, :integer
    field :experiment_name, :string
    field :notes, :string
    field :box_row, :integer
    field :box_column, :integer

    timestamps()

    belongs_to(:box, Box, foreign_key: :box_id)
  end

  def changeset(sample, attrs) do
    sample
    |> cast(attrs, [:number, :name, :cell_count, :experiment_name, :notes, :box_id])
    |> validate_required([:number, :name, :box_id])
  end
end
