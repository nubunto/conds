defmodule Conds.PageController do
  use Conds.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
