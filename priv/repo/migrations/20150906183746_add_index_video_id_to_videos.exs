defmodule ElixirResources.Repo.Migrations.AddIndexVideoIdToVideos do
  use Ecto.Migration

  def up do
    create index(:videos, [:video_id], unique: true)
  end

  def down do
    drop index(:videos, [:video_id])
  end
end
