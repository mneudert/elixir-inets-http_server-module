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

  test "httpd server sleeping response" do
    port               = Application.get_env(:inets_server_module, :port)
    { time, response } = :timer.tc fn ->
      "http://localhost:#{ port }/sleepy.head/500"
      |> to_charlist()
      |> :httpc.request()
    end

    assert { :ok, {{ _, 200, _ }, _, 'slept for 500' }} = response
    assert time >= 500
  end
end
