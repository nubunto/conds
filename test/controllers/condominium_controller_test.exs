defmodule Conds.CondominiumControllerTest do
  use Conds.ConnCase

  alias Conds.Condominium
  @valid_attrs %{address: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, condominium_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing condos"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, condominium_path(conn, :new)
    assert html_response(conn, 200) =~ "New condominium"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, condominium_path(conn, :create), condominium: @valid_attrs
    assert redirected_to(conn) == condominium_path(conn, :index)
    assert Repo.get_by(Condominium, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, condominium_path(conn, :create), condominium: @invalid_attrs
    assert html_response(conn, 200) =~ "New condominium"
  end

  test "shows chosen resource", %{conn: conn} do
    condominium = Repo.insert! %Condominium{}
    conn = get conn, condominium_path(conn, :show, condominium)
    assert html_response(conn, 200) =~ "Show condominium"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, condominium_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    condominium = Repo.insert! %Condominium{}
    conn = get conn, condominium_path(conn, :edit, condominium)
    assert html_response(conn, 200) =~ "Edit condominium"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    condominium = Repo.insert! %Condominium{}
    conn = put conn, condominium_path(conn, :update, condominium), condominium: @valid_attrs
    assert redirected_to(conn) == condominium_path(conn, :show, condominium)
    assert Repo.get_by(Condominium, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    condominium = Repo.insert! %Condominium{}
    conn = put conn, condominium_path(conn, :update, condominium), condominium: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit condominium"
  end

  test "deletes chosen resource", %{conn: conn} do
    condominium = Repo.insert! %Condominium{}
    conn = delete conn, condominium_path(conn, :delete, condominium)
    assert redirected_to(conn) == condominium_path(conn, :index)
    refute Repo.get(Condominium, condominium.id)
  end
end
