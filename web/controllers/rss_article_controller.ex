defmodule ElixirResources.RssArticleController do
  use ElixirResources.Web, :controller
	
	alias ElixirResources.Repo
	alias ElixirResources.RssArticle
	
  def index(conn, _params) do
		
		rss_articles = Repo.all(RssArticle)
		
		render conn, "index.html", rss_articles: rss_articles
		
  end
	
end
