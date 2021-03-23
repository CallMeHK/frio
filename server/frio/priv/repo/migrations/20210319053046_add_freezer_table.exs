defmodule Frio.Repo.Migrations.AddFreezerTable do
  use Ecto.Migration

  def change do
    create table(:freezers) do
      add :name, :string
      add :model, :string

      timestamps()
    end

    create table(:boxes) do
      add :number, :integer
      add :freezer_id, references(:freezers)
      add :capacity, :integer

      timestamps()
    end

    create table(:subboxes) do
      add :number, :integer
      add :box_id, references(:boxes)
      add :capacity, :integer

      timestamps()
    end

    create table(:users) do
      add :username, :string

      timestamps()
    end

    create table(:samples) do
      add :number, :integer
      add :name, :string
      add :sub_box_id, references(:subboxes)
      add :cell_count, :integer
      add :experiment_name, :string
      add :notes, :string
      add :user_id, references(:users)

      timestamps()
    end

    create table(:sample_transactions) do
      add :sample_id, references(:samples)
      add :user_id, references(:users)

      timestamps()
    end

 end
end
