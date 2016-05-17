defmodule Conds.ApartmentControllerTest do
  use Conds.ConnCase

  alias Conds.Apartment
  @valid_attrs %{building: "some content", number: 42}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, apartment_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing apartments"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, apartment_path(conn, :new)
    assert html_response(conn, 200) =~ "New apartment"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, apartment_path(conn, :create), apartment: @valid_attrs
    assert redirected_to(conn) == apartment_path(conn, :index)
    assert Repo.get_by(Apartment, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, apartment_path(conn, :create), apartment: @invalid_attrs
    assert html_response(conn, 200) =~ "New apartment"
  end

  test "shows chosen resource", %{conn: conn} do
    apartment = Repo.insert! %Apartment{}
    conn = get conn, apartment_path(conn, :show, apartment)
    assert html_response(conn, 200) =~ "Show apartment"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, apartment_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    apartment = Repo.insert! %Apartment{}
    conn = get conn, apartment_path(conn, :edit, apartment)
    assert html_response(conn, 200) =~ "Edit apartment"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    apartment = Repo.insert! %Apartment{}
    conn = put conn, apartment_path(conn, :update, apartment), apartment: @valid_attrs
    assert redirected_to(conn) == apartment_path(conn, :show, apartment)
    assert Repo.get_by(Apartment, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    apartment = Repo.insert! %Apartment{}
    conn = put conn, apartment_path(conn, :update, apartment), apartment: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit apartment"
  end

  test "deletes chosen resource", %{conn: conn} do
    apartment = Repo.insert! %Apartment{}
    conn = delete conn, apartment_path(conn, :delete, apartment)
    assert redirected_to(conn) == apartment_path(conn, :index)
    refute Repo.get(Apartment, apartment.id)
  end
end
