defmodule ElixirResources.Repo.Migrations.CreateRssArticle do
  use Ecto.Migration

  def change do
    create table(:rss_articles) do
      add :title, :string
      add :url, :string
      add :description, :text

      timestamps
    end

  end
end
