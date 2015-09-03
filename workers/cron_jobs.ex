defmodule ElixirResources.Workers.CronJobs do
  def look_youtube do
    IO.puts "Looking for youtube videos..."
    Exq.enqueue :exq, "aggregator", "ElixirResources.Workers.YoutubeWorker", []
  end

  def look_rss do
    IO.puts "Looking for rss feeds..."
  end
end
