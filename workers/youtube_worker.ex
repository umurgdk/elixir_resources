defmodule ElixirResources.Workers.YoutubeWorker do
  alias ElixirResources.Repo
  alias ElixirResources.Video

  def perform do
    IO.puts "YoutubeWorker fetching youtube videos..."

    Enum.each YoutubeApi.search("elixir,programming"), fn(video) ->
      #unless Repo.get_by(Video, video_id: video.id) do
        changeset = Video.changeset(%Video{}, %{
          provider: "youtube",
          video_id: video.id,
          title: video.title,
          description: video.title,
          thumbnail: YoutubeApi.Video.get_best_thumbnail(video)
        })

        case Repo.insert(changeset) do
          {:ok, video}         -> IO.puts "Video titled '#{video.title}' has beed added."
          {:error, %{errors: [video_id: "has already been taken"]}} -> :ok
          {:error, error_changeset} ->
            IO.puts "Failed to write:"
            IO.inspect(error_changeset)
        end
      #end
    end
  end
end
