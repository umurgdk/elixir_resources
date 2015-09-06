defmodule ElixirResources.Repo.Migrations.CreateVideo do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :title, :string
      add :provider, :string
      add :video_id, :string
      add :description, :text
      add :thumbnail, :string

      timestamps
    end

  end
end
