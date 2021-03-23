# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Frio.Repo.insert!(%Frio.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#

defmodule Frio.SeedDB do
  alias Frio.Repo.Freezers
  alias Frio.Repo.Boxes
  alias Frio.Repo.SubBoxes
  alias Frio.Repo.Samples
  alias Frio.SeedDB
  alias Frio.Repo

  def seed_freezers do
    Freezers.insert(%{name: "Freezer 1"}) 
    Freezers.insert(%{name: "Freezer 2"}) 
  end

  def seed_boxes do

    Freezers.all()
    |> Enum.map(fn freezer ->
      Boxes.insert(%{
        number: 1,
        freezer_id: freezer.id,
        capacity: 10
      })
      Boxes.insert(%{
        number: 2,
        freezer_id: freezer.id,
        capacity: 10
      })
      end)
  end

  def seed_subboxes do
    Boxes.all()
    |> Enum.map(fn box -> 
      SubBoxes.insert(%{
        number: 1,
        box_id: box.id,
        capacity: 64
      })
      SubBoxes.insert(%{
        number: 2,
        box_id: box.id,
        capacity: 64
      })
      SubBoxes.insert(%{
        number: 3,
        box_id: box.id,
        capacity: 64
      })
      SubBoxes.insert(%{
        number: 4,
        box_id: box.id,
        capacity: 64
      })
    end)
  end

  def seed_samples do 
    SubBoxes.all()
    |> Enum.map(fn subbox -> 
      1..12
      |> Enum.map(fn index -> 
        Samples.insert(%{
          number: index,
          name: "sample-#{subbox.id}-#{index}",
          cell_count: index * 32 * subbox.id * 10000,
          sub_box_id: subbox.id
        })
      end)
    end)
  end


  def log_seeds do
    Freezers.all()
    |> Repo.preload(boxes: [subboxes: [:samples]])
    |> IO.inspect()
  end

  def run_seeds do
    SeedDB.seed_freezers()
    SeedDB.seed_boxes()
    SeedDB.seed_subboxes()
    SeedDB.seed_samples()

    SeedDB.log_seeds()
  end
end

Frio.SeedDB.run_seeds

