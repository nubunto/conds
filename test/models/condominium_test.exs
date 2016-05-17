defmodule Conds.CondominiumTest do
  use Conds.ModelCase

  alias Conds.Condominium

  @valid_attrs %{address: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Condominium.changeset(%Condominium{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Condominium.changeset(%Condominium{}, @invalid_attrs)
    refute changeset.valid?
  end
end
