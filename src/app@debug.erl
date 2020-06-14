%%%-------------------------------------------------------------------
%% @doc debug public API
%% @end
%%%-------------------------------------------------------------------

-module(app@debug).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    sup@debug:start_link().

stop(_State) ->
    ok.

%% internal functions
