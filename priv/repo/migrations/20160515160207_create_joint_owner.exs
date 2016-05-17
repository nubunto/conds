defmodule Conds.Repo.Migrations.CreateJointOwner do
  use Ecto.Migration

  def change do
    create table(:joint_owner) do
      add :name, :string

      timestamps
    end

  end
end
