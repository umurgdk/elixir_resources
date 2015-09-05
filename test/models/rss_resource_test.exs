defmodule ElixirResources.RssResourceTest do
  use ElixirResources.ModelCase

  alias ElixirResources.RssResource

  @valid_attrs %{url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = RssResource.changeset(%RssResource{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = RssResource.changeset(%RssResource{}, @invalid_attrs)
    refute changeset.valid?
  end
end
