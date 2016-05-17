defmodule Conds.BuildingTest do
  use Conds.ModelCase

  alias Conds.Building

  @valid_attrs %{apartments_per_floor: 42, floors: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Building.changeset(%Building{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Building.changeset(%Building{}, @invalid_attrs)
    refute changeset.valid?
  end
end
