defmodule Conds.ApartmentController do
  use Conds.Web, :controller

  alias Conds.Apartment

  plug :scrub_params, "apartment" when action in [:create, :update]

  def index(conn, _params) do
    apartments = Repo.all(Apartment)
    render(conn, "index.html", apartments: apartments)
  end

  def new(conn, _params) do
    changeset = Apartment.changeset(%Apartment{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"apartment" => apartment_params}) do
    changeset = Apartment.changeset(%Apartment{}, apartment_params)

    case Repo.insert(changeset) do
      {:ok, _apartment} ->
        conn
        |> put_flash(:info, "Apartment created successfully.")
        |> redirect(to: apartment_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    apartment = Repo.get!(Apartment, id)
    render(conn, "show.html", apartment: apartment)
  end

  def edit(conn, %{"id" => id}) do
    apartment = Repo.get!(Apartment, id)
    changeset = Apartment.changeset(apartment)
    render(conn, "edit.html", apartment: apartment, changeset: changeset)
  end

  def update(conn, %{"id" => id, "apartment" => apartment_params}) do
    apartment = Repo.get!(Apartment, id)
    changeset = Apartment.changeset(apartment, apartment_params)

    case Repo.update(changeset) do
      {:ok, apartment} ->
        conn
        |> put_flash(:info, "Apartment updated successfully.")
        |> redirect(to: apartment_path(conn, :show, apartment))
      {:error, changeset} ->
        render(conn, "edit.html", apartment: apartment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    apartment = Repo.get!(Apartment, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(apartment)

    conn
    |> put_flash(:info, "Apartment deleted successfully.")
    |> redirect(to: apartment_path(conn, :index))
  end
end
