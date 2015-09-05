defmodule ElixirResources.Repo.Migrations.CreateRssResource do
  use Ecto.Migration

  def change do
    create table(:rss_resources) do
      add :url, :string

      timestamps
    end

  end
end
