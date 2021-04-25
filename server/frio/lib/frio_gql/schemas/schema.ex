defmodule FrioGql.Schema do
  use Absinthe.Schema
  alias FrioGql.Resolvers

  import_types FrioGql.Schema.Comment
  import_types FrioGql.Schema.Freezer
  import_types FrioGql.Schema.Rack
  import_types FrioGql.Schema.Box
  import_types FrioGql.Schema.Sample
  import_types Absinthe.Type.Custom

  query do

    @desc "Get all comments"
    field :comments, list_of(:comment) do
      resolve &Resolvers.Comment.all/3
    end

    @desc "Get all freezers"
    field :freezers, list_of(:freezer) do
      resolve &Resolvers.Freezer.all/3
    end

    @desc "Get all racks"
    field :racks, list_of(:rack) do
      resolve &Resolvers.Rack.all/3
    end

    @desc "Get all boxes"
    field :boxes, list_of(:box) do
      resolve &Resolvers.Box.all/3
    end

    @desc "Get all samples"
    field :samples, list_of(:sample) do
      resolve &Resolvers.Sample.all/3
    end
  end

  mutation do
    import_fields :sample_mutations
  end

end

