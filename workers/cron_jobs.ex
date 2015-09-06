defmodule ElixirResources.Workers.CronJobs do
  	
  alias ElixirResources.Repo
  alias ElixirResources.RssResource

  def look_youtube do
    IO.puts "Looking for youtube videos..."
    Exq.enqueue :exq, "aggregator", "ElixirResources.Workers.YoutubeWorker", []
  end

  def look_rss do
    IO.puts "Loading all resources from RssResource"

    Enum.each Repo.all(RssResource), fn(rss_resource) ->
    	IO.puts "Loading rss resource: #{rss_resource.url}"
    	Exq.enqueue :exq, "aggregator", "ElixirResources.Workers.RSSWorker", [rss_resource.url]
    end
  end
end
