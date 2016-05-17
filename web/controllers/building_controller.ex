defmodule Conds.BuildingController do
  use Conds.Web, :controller

  alias Conds.Building

  plug :scrub_params, "building" when action in [:create, :update]

  def index(conn, _params) do
    buildings = Repo.all(Building)
    render(conn, "index.html", buildings: buildings)
  end

  def new(conn, _params) do
    changeset = Building.changeset(%Building{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"building" => building_params}) do
    changeset = Building.changeset(%Building{}, building_params)

    case Repo.insert(changeset) do
      {:ok, _building} ->
        conn
        |> put_flash(:info, "Building created successfully.")
        |> redirect(to: building_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    building = Repo.get!(Building, id)
    render(conn, "show.html", building: building)
  end

  def edit(conn, %{"id" => id}) do
    building = Repo.get!(Building, id)
    changeset = Building.changeset(building)
    render(conn, "edit.html", building: building, changeset: changeset)
  end

  def update(conn, %{"id" => id, "building" => building_params}) do
    building = Repo.get!(Building, id)
    changeset = Building.changeset(building, building_params)

    case Repo.update(changeset) do
      {:ok, building} ->
        conn
        |> put_flash(:info, "Building updated successfully.")
        |> redirect(to: building_path(conn, :show, building))
      {:error, changeset} ->
        render(conn, "edit.html", building: building, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    building = Repo.get!(Building, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(building)

    conn
    |> put_flash(:info, "Building deleted successfully.")
    |> redirect(to: building_path(conn, :index))
  end
end
