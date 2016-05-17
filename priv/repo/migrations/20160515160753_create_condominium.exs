defmodule Conds.Repo.Migrations.CreateCondominium do
  use Ecto.Migration

  def change do
    create table(:condos) do
      add :name, :string
      add :address, :string

      timestamps
    end

  end
end
