defmodule Conds.Router do
  use Conds.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", Conds do
    pipe_through :browser

    get "/", PageController, :index

    resources "/joint_owner", JointOwnerController
    resources "/apartments", ApartmentController
    resources "/buildings", BuildingController
    resources "/condos", CondominiumController
    resources "/resources", ResourceController
    resources "/events", EventController
  end
end
