defmodule FrioGql.Schema.Sample do
  use Absinthe.Schema.Notation
  alias FrioGql.Resolvers

  object :sample do
    field :id, :id

    field :number, :integer
    field :name, :string
    field :cell_count, :integer
    field :experiment_name, :string
    field :notes, :string
    field :sub_box_id, :integer
 

    field :inserted_at, :naive_datetime
    field :updated_at, :naive_datetime
  end

  object :sample_mutations do
    @desc "Create a sample"
    field :create_sample, type: :sample do
      arg :number, non_null :integer
      arg :name, :string
      arg :cell_count, :integer
      arg :experiment_name, :string
      arg :notes, :string
      arg :sub_box_id, non_null :integer

      resolve &Resolvers.Sample.create/3
    end

    @desc "Create a sample"
    field :update_sample, type: :sample do
      arg :id, non_null :integer
      arg :number, :integer
      arg :name, :string
      arg :cell_count, :integer
      arg :experiment_name, :string
      arg :notes, :string
      arg :sub_box_id, :integer

      resolve &Resolvers.Sample.update/3
    end

  end
end
