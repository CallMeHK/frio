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
  alias Frio.Repo.Racks
  alias Frio.Repo.Boxes
  alias Frio.Repo.Samples
  alias Frio.SeedDB
  alias Frio.Repo

  def seed_freezers do
    Freezers.insert(%{name: "Freezer 1"}) 
    Freezers.insert(%{name: "Freezer 2"}) 
  end

  def seed_racks do

    Freezers.all()
    |> Enum.map(fn freezer ->
      Racks.insert(%{
        number: 1,
        freezer_id: freezer.id,
        capacity: 10
      })
      Racks.insert(%{
        number: 2,
        freezer_id: freezer.id,
        capacity: 10
      })
      end)
  end

  def seed_boxes do
    Racks.all()
    |> Enum.map(fn rack -> 
      Boxes.insert(%{
        number: 1,
        rack_id: rack.id,
        capacity: 64
      })
      Boxes.insert(%{
        number: 2,
        rack_id: rack.id,
        capacity: 64
      })
      Boxes.insert(%{
        number: 3,
        rack_id: rack.id,
        capacity: 64
      })
      Boxes.insert(%{
        number: 4,
        rack_id: rack.id,
        capacity: 64
      })
    end)
  end

  def seed_samples do 
    Boxes.all()
    |> Enum.map(fn box -> 
      1..12
      |> Enum.map(fn index -> 
        Samples.insert(%{
          number: index,
          name: "sample-#{box.id}-#{index}",
          cell_count: index * 32 * box.id * 10000,
          box_id: box.id
        })
      end)
    end)
  end


  def log_seeds do
    Freezers.all()
    |> Repo.preload(racks: [boxes: [:samples]])
    |> IO.inspect()
  end

  def run_seeds do
    SeedDB.seed_freezers()
    SeedDB.seed_racks()
    SeedDB.seed_boxes()
    SeedDB.seed_samples()

    SeedDB.log_seeds()
  end
end

Frio.SeedDB.run_seeds

