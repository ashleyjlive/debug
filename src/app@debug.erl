%%%-------------------------------------------------------------------
%% @doc debug public API
%% @end
%%%-------------------------------------------------------------------

-module(app@debug).

-behaviour(application).

%%% -- public control --
-export([start/2, stop/1]).

%%% -- public interface --
-export([start_args/1, start_arg/2]).

%%% -- public control ----------------------------------------------------------
start(_StartType, _StartArgs) ->
    sup@debug:start_link().

stop(_State) ->
    ok.

%%% -- public interface --------------------------------------------------------
start_args([_|_]=RqArgs) ->
    Args = #{} = application:get_env(?MODULE, start_args, #{}),
    [start_arg(RqArg, Args) || RqArg <- RqArgs].

%% internal functions
start_arg(primary_cfg, #{}=Args) ->
    Args0 = maps:get(primary_cfg, Args, #{}),
    DfltArgs = #{level => debug},
    maps:merge(DfltArgs, Args0);
start_arg(logger_std_h, #{}=Args) ->
    Args0 = maps:get(logger_std_h, Args, #{}),
    DfltConfig =
        #{type => file, max_no_bytes => 104857600, compress_on_rotate => true,
          max_no_files => 10,
          file => filename@debug:site_data(["debug", "logger_std_h.log"])},
    DfltArgs = 
        #{config => DfltConfig, 
          formatter => {logger_formatter, #{single_line => false}}},
    maps:merge(DfltArgs, Args0);
start_arg(sys_ops, #{}=Args) ->
    maps:get(sys_ops, Args, []).