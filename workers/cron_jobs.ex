defmodule ElixirResources.Workers.CronJobs do
  def look_videos do
    IO.puts "Looking for youtube videos..."
    Exq.enqueue :exq, "aggregator", "ElixirResources.Workers.YoutubeWorker", []
    # TODO: enqueue VimeoWorker
  end

  def look_rss do
    IO.puts "Looking for rss feeds..."
    Exq.enqueue :exq, "aggregator", "ElixirResources.Workers.RSSWorker", []
  end
end
