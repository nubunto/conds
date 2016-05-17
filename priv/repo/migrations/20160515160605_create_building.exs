defmodule Conds.Repo.Migrations.CreateBuilding do
  use Ecto.Migration

  def change do
    create table(:buildings) do
      add :name, :string
      add :floors, :integer
      add :apartments_per_floor, :integer

      timestamps
    end

  end
end
