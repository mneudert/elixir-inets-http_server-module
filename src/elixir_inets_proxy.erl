-module(elixir_inets_proxy).

-export([do/1]).

do(ModData) ->
    'Elixir.InetsServerModule':serve(ModData).
