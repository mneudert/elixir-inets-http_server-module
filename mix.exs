defmodule InetsServerModule.Mixfile do
  use Mix.Project

  def project do
    [app: :inets_server_module,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: []]
  end

  def application, do: []
end
