defmodule Conds.JointOwnerControllerTest do
  use Conds.ConnCase

  alias Conds.JointOwner
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, joint_owner_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing joint owner"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, joint_owner_path(conn, :new)
    assert html_response(conn, 200) =~ "New joint owner"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, joint_owner_path(conn, :create), joint_owner: @valid_attrs
    assert redirected_to(conn) == joint_owner_path(conn, :index)
    assert Repo.get_by(JointOwner, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, joint_owner_path(conn, :create), joint_owner: @invalid_attrs
    assert html_response(conn, 200) =~ "New joint owner"
  end

  test "shows chosen resource", %{conn: conn} do
    joint_owner = Repo.insert! %JointOwner{}
    conn = get conn, joint_owner_path(conn, :show, joint_owner)
    assert html_response(conn, 200) =~ "Show joint owner"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, joint_owner_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    joint_owner = Repo.insert! %JointOwner{}
    conn = get conn, joint_owner_path(conn, :edit, joint_owner)
    assert html_response(conn, 200) =~ "Edit joint owner"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    joint_owner = Repo.insert! %JointOwner{}
    conn = put conn, joint_owner_path(conn, :update, joint_owner), joint_owner: @valid_attrs
    assert redirected_to(conn) == joint_owner_path(conn, :show, joint_owner)
    assert Repo.get_by(JointOwner, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    joint_owner = Repo.insert! %JointOwner{}
    conn = put conn, joint_owner_path(conn, :update, joint_owner), joint_owner: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit joint owner"
  end

  test "deletes chosen resource", %{conn: conn} do
    joint_owner = Repo.insert! %JointOwner{}
    conn = delete conn, joint_owner_path(conn, :delete, joint_owner)
    assert redirected_to(conn) == joint_owner_path(conn, :index)
    refute Repo.get(JointOwner, joint_owner.id)
  end
end
