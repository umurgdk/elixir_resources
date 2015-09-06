defmodule YoutubeApi.Video do
  defstruct title: "", id: "", description: "", thumbnails: []

  def from_json(json_dict) do
    json_thumbnails = json_dict["snippet"]["thumbnails"]
    thumbnail_keys = ["default", "high", "medium"]

    thumbnails = Enum.reduce thumbnail_keys, HashDict.new, fn(key, dict) ->
      case Dict.has_key? json_thumbnails, key do
        true -> Dict.put dict, String.to_atom(key), json_thumbnails[key]["url"]
        _ -> dict
      end
    end

    %__MODULE__{
      title: json_dict["snippet"]["title"],
      id: json_dict["id"]["videoId"],
      description: json_dict["snippet"]["description"],
      thumbnails: thumbnails
    }
  end
end
