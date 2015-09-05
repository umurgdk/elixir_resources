defmodule ElixirResources.RssResource do
	
	alias ElixirResources.RssResource
	alias ElixirResources.Repo
	
  use ElixirResources.Web, :model

  schema "rss_resources" do
    field :url, :string

    timestamps
  end

  @required_fields ~w(url)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
  
  def create(url) do
    # todo
  end
end
