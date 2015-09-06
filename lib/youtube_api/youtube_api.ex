defmodule YoutubeApi do
  alias YoutubeApi.Video

  @base_url "https://www.googleapis.com/youtube/v3/"

  def api_key do
    Application.get_env(:elixir_resources, :GOOGLE_API_KEY) || System.get_env("GOOGLE_API_KEY")
  end

  def search(query, max_results \\ 50) do
    {:ok, response} = make_request("search", [
      q: query,
      part: "snippet",
      order: "date",
      maxResults: max_results,
      type: "video"
    ])

    Enum.map response["items"], &Video.from_json(&1)
  end

  defp make_request(path, parameters) do
    url = "#{@base_url}#{path}"
    parameters_with_apikey = parameters ++ [key: api_key]

    case HTTPJson.get(url, [], [params: parameters_with_apikey]) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}

      {:ok, %HTTPoison.Response{status_code: 400, body: body}} ->
        {:error, body}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

end
