defmodule Conds.EventTest do
  use Conds.ModelCase

  alias Conds.Event

  @valid_attrs %{end: "2010-04-17 14:00:00", name: "some content", start: "2010-04-17 14:00:00"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
