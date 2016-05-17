defmodule Conds.JointOwnerController do
  use Conds.Web, :controller

  alias Conds.JointOwner

  plug :scrub_params, "joint_owner" when action in [:create, :update]

  def index(conn, _params) do
    joint_owner = Repo.all(JointOwner)
    render(conn, "index.html", joint_owner: joint_owner)
  end

  def new(conn, _params) do
    changeset = JointOwner.changeset(%JointOwner{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"joint_owner" => joint_owner_params}) do
    changeset = JointOwner.changeset(%JointOwner{}, joint_owner_params)

    case Repo.insert(changeset) do
      {:ok, _joint_owner} ->
        conn
        |> put_flash(:info, "Joint owner created successfully.")
        |> redirect(to: joint_owner_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    joint_owner = Repo.get!(JointOwner, id)
    render(conn, "show.html", joint_owner: joint_owner)
  end

  def edit(conn, %{"id" => id}) do
    joint_owner = Repo.get!(JointOwner, id)
    changeset = JointOwner.changeset(joint_owner)
    render(conn, "edit.html", joint_owner: joint_owner, changeset: changeset)
  end

  def update(conn, %{"id" => id, "joint_owner" => joint_owner_params}) do
    joint_owner = Repo.get!(JointOwner, id)
    changeset = JointOwner.changeset(joint_owner, joint_owner_params)

    case Repo.update(changeset) do
      {:ok, joint_owner} ->
        conn
        |> put_flash(:info, "Joint owner updated successfully.")
        |> redirect(to: joint_owner_path(conn, :show, joint_owner))
      {:error, changeset} ->
        render(conn, "edit.html", joint_owner: joint_owner, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    joint_owner = Repo.get!(JointOwner, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(joint_owner)

    conn
    |> put_flash(:info, "Joint owner deleted successfully.")
    |> redirect(to: joint_owner_path(conn, :index))
  end
end
