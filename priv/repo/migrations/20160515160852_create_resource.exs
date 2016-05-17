defmodule Conds.Repo.Migrations.CreateResource do
  use Ecto.Migration

  def change do
    create table(:resources) do
      add :name, :string

      timestamps
    end

  end
end
