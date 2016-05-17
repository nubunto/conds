defmodule Conds.Building do
  use Conds.Web, :model

  schema "buildings" do
    field :name, :string
    field :floors, :integer
    field :apartments_per_floor, :integer

    timestamps
  end

  @required_fields ~w(name floors apartments_per_floor)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
