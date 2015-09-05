defmodule HTTPJson do
  use HTTPoison.Base  

  def process_response_body(body) do
    body
    |> Poison.decode!
  end
end
