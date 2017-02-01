defmodule InetsServerModule do
  @moduledoc false

  def serve(_mod_data) do
    body = 'document root\n'
    head = [
      code:           200,
      content_length: body |> length() |> to_charlist(),
      content_type:   'text/html'
    ]

    {:proceed, [{:response, {:response, head, body}}]}
  end
end
