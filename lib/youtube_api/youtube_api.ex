defmodule YoutubeApi do
  @base_url "https://www.googleapis.com/youtube/v3/"
  @api_key System.get_env("GOOGLE_API_KEY")

  def search(query) do
    make_request("search", [
      q: query,
      part: "snippet",
      order: "date"
    ])
  end

  defp make_request(path, parameters) do
    url = "#{@base_url}#{path}"
    parameters_with_apikey = parameters ++ [key: @api_key]

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
