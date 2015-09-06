defmodule ElixirResources.Video do
  use ElixirResources.Web, :model

  schema "videos" do
    field :title, :string
    field :provider, :string
    field :video_id, :string
    field :description, :string
    field :thumbnail, :string

    timestamps
  end

  @required_fields ~w(title provider video_id)
  @optional_fields ~w(description thumbnail)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:video_id)
  end
end
