defmodule InetsServerModule do
  @moduledoc false

  require Record

  Record.defrecord :mod, Record.extract(:mod, from_lib: "inets/include/httpd.hrl")

  def serve(mod_data), do: serve_uri(mod(mod_data, :request_uri), mod_data)


  defp headers(body) do
    [
      code:           200,
      content_length: body |> length() |> to_charlist(),
      content_type:   'text/html'
    ]
  end

  defp serve_uri('/index.html', _mod_data) do
    body = 'document: /index.html'
    head = headers(body)

    {:proceed, [{:response, {:response, head, body}}]}
  end

  defp serve_uri('/sleepy.head/500', _mod_data) do
    :timer.sleep(500)

    body = 'slept for 500'
    head = headers(body)

    { :proceed, [{ :response, { :response, head, body }}]}
  end
end
