defmodule ElixirResources.Workers.RSSWorker do
  
  alias ElixirResources.Repo
  alias ElixirResources.Response
  alias ElixirResources.RssArticle

  def perform(url) do
    
		# TODO: Rss
		
    IO.puts "Worker fetching rss streams..."
		
		{:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url)
		{:ok, feed, _} = FeederEx.parse(body)
		
		Enum.each feed.entries, fn(entry) ->

			unless entry.link != nil && Repo.get_by(RssArticle, url: entry.link) do
				
				changeset = RssArticle.changeset(%RssArticle{}, %{
					title: entry.title,
					url: entry.link,
					description: entry.summary
				})

				case Repo.insert(changeset) do

					{:ok, rss_resource} -> IO.puts("RSS titled '#{rss_resource.title}' has been added to db.")
					{:error, rss_resource_fail} ->
						IO.puts("RSS failed to add:")
						IO.inspect(rss_resource_fail)

				end
			end

		end
		
  end
end
