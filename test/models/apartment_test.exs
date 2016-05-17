defmodule Conds.ApartmentTest do
  use Conds.ModelCase

  alias Conds.Apartment

  @valid_attrs %{building: "some content", number: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Apartment.changeset(%Apartment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Apartment.changeset(%Apartment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
