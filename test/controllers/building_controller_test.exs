defmodule Conds.BuildingControllerTest do
  use Conds.ConnCase

  alias Conds.Building
  @valid_attrs %{apartments_per_floor: 42, floors: 42, name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, building_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing buildings"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, building_path(conn, :new)
    assert html_response(conn, 200) =~ "New building"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, building_path(conn, :create), building: @valid_attrs
    assert redirected_to(conn) == building_path(conn, :index)
    assert Repo.get_by(Building, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, building_path(conn, :create), building: @invalid_attrs
    assert html_response(conn, 200) =~ "New building"
  end

  test "shows chosen resource", %{conn: conn} do
    building = Repo.insert! %Building{}
    conn = get conn, building_path(conn, :show, building)
    assert html_response(conn, 200) =~ "Show building"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, building_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    building = Repo.insert! %Building{}
    conn = get conn, building_path(conn, :edit, building)
    assert html_response(conn, 200) =~ "Edit building"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    building = Repo.insert! %Building{}
    conn = put conn, building_path(conn, :update, building), building: @valid_attrs
    assert redirected_to(conn) == building_path(conn, :show, building)
    assert Repo.get_by(Building, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    building = Repo.insert! %Building{}
    conn = put conn, building_path(conn, :update, building), building: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit building"
  end

  test "deletes chosen resource", %{conn: conn} do
    building = Repo.insert! %Building{}
    conn = delete conn, building_path(conn, :delete, building)
    assert redirected_to(conn) == building_path(conn, :index)
    refute Repo.get(Building, building.id)
  end
end
