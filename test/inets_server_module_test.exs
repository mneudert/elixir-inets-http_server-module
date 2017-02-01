defmodule InetsServerModuleTest do
  use ExUnit.Case

  test "httpd server responding" do
    port     = Application.get_env(:inets_server_module, :port)
    response =
      "http://localhost:#{ port }/index.html"
      |> to_charlist()
      |> :httpc.request()

    assert { :ok, {{ _, 200, _ }, _, 'document: /index.html' }} = response
  end
end
