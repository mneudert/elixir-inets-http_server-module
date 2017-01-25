root          = Path.join([ __DIR__, "document_root" ]) |> to_char_list()
httpd_config  = [
  document_root: root,
  port:          0,
  server_name:   'elixir_httpd_module_test',
  server_root:   root
]

:ok                = :inets.start()
{ :ok, httpd_pid } = :inets.start(:httpd, httpd_config)

Application.put_env(:inets_server_module, :port, :httpd.info(httpd_pid)[:port])

ExUnit.start()
