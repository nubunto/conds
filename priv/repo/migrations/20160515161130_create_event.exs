defmodule Conds.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :start, :datetime
      add :end, :datetime

      timestamps
    end

  end
end
