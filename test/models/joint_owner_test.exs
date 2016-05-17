defmodule Conds.JointOwnerTest do
  use Conds.ModelCase

  alias Conds.JointOwner

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = JointOwner.changeset(%JointOwner{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = JointOwner.changeset(%JointOwner{}, @invalid_attrs)
    refute changeset.valid?
  end
end
