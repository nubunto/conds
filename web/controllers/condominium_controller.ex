defmodule Conds.CondominiumController do
  use Conds.Web, :controller

  alias Conds.Condominium

  plug :scrub_params, "condominium" when action in [:create, :update]

  def index(conn, _params) do
    condos = Repo.all(Condominium)
    render(conn, "index.html", condos: condos)
  end

  def new(conn, _params) do
    changeset = Condominium.changeset(%Condominium{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"condominium" => condominium_params}) do
    changeset = Condominium.changeset(%Condominium{}, condominium_params)

    case Repo.insert(changeset) do
      {:ok, _condominium} ->
        conn
        |> put_flash(:info, "Condominium created successfully.")
        |> redirect(to: condominium_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    condominium = Repo.get!(Condominium, id)
    render(conn, "show.html", condominium: condominium)
  end

  def edit(conn, %{"id" => id}) do
    condominium = Repo.get!(Condominium, id)
    changeset = Condominium.changeset(condominium)
    render(conn, "edit.html", condominium: condominium, changeset: changeset)
  end

  def update(conn, %{"id" => id, "condominium" => condominium_params}) do
    condominium = Repo.get!(Condominium, id)
    changeset = Condominium.changeset(condominium, condominium_params)

    case Repo.update(changeset) do
      {:ok, condominium} ->
        conn
        |> put_flash(:info, "Condominium updated successfully.")
        |> redirect(to: condominium_path(conn, :show, condominium))
      {:error, changeset} ->
        render(conn, "edit.html", condominium: condominium, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    condominium = Repo.get!(Condominium, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(condominium)

    conn
    |> put_flash(:info, "Condominium deleted successfully.")
    |> redirect(to: condominium_path(conn, :index))
  end
end
