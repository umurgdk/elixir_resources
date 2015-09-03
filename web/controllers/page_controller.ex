defmodule ElixirResources.PageController do
  use ElixirResources.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
