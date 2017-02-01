defmodule InetsServerModule do
  @moduledoc false

  require Record

  Record.defrecord :mod, Record.extract(:mod, from_lib: "inets/include/httpd.hrl")

  def serve(mod_data) do
    body = 'document: ' ++ mod(mod_data, :request_uri)
    head = [
      code:           200,
      content_length: body |> length() |> to_charlist(),
      content_type:   'text/html'
    ]

    {:proceed, [{:response, {:response, head, body}}]}
  end
end
