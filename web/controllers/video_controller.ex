defmodule ElixirResources.VideoController do
  use ElixirResources.Web, :controller

  alias ElixirResources.Repo
  alias ElixirResources.Video

  def index(conn, _params) do
    videos = Repo.all(Video)
    render conn, "index.html", videos: videos
  end
end
