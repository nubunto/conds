defmodule Conds.Repo.Migrations.CreateApartment do
  use Ecto.Migration

  def change do
    create table(:apartments) do
      add :number, :integer
      add :building, :string

      timestamps
    end

  end
end
