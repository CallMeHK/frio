defmodule Frio.Sample do
  use Ecto.Schema
  import Ecto.Changeset

  alias Frio.SubBox

  schema "samples" do
    field :number, :integer
    field :name, :string
    field :cell_count, :integer
    field :experiment_name, :string
    field :notes, :string


    timestamps()

    belongs_to(:sub_box, SubBox, foreign_key: :sub_box_id)
  end

  def changeset(sample, attrs) do
    sample
    |> cast(attrs, [:number, :name, :cell_count, :experiment_name, :notes, :sub_box_id])
    |> validate_required([:number, :name, :sub_box_id])
  end
end
