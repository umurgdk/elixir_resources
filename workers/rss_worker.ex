defmodule ElixirResources.Workers.RSSWorker do
  def perform do
    
		# TODO: Rss
		
    IO.puts "Worker fetching rss streams..."
		
		HTTPoison.start
		
		{:ok, %HTTPoison.Response{body: body}} = HTTPoison.get("http://www.rssboard.org/files/sample-rss-2.xml")
		{:ok, feed, _} = FeederEx.parse(body)
		
		Enum.map feed.entries, fn(entry) -> IO.puts(entry.title) end
		
  end
end
