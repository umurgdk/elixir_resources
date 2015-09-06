defmodule ElixirResources.VideoTest do
  use ElixirResources.ModelCase

  alias ElixirResources.Video

  @valid_attrs %{description: "some content", provider: "some content", thumbnail: "some content", title: "some content", video_id: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Video.changeset(%Video{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Video.changeset(%Video{}, @invalid_attrs)
    refute changeset.valid?
  end
end
