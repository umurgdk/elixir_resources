defmodule ElixirResources.YoutubeApiTest do
  use ExUnit.Case, async: false
  import Mock

  setup do
    Application.put_env :elixir_resources, :GOOGLE_API_KEY, "api_key"
  end

  test_with_mock "search", HTTPJson, [get: fn(url, headers, opts) -> {:ok, %HTTPoison.Response{status_code: 200, body: "[]"}} end]  do
    YoutubeApi.search "elixir"

    assert called HTTPJson.get("https://www.googleapis.com/youtube/v3/search", [], [params: [
        q: "elixir",
        part: "snippet",
        order: "date",
        maxResults: 50,
        type: "video",
        key: "api_key",
      ]])
  end
end
