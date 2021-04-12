%%%-------------------------------------------------------------------
%% @doc debug public API
%% @end
%%%-------------------------------------------------------------------

-module(app@debug).

-behaviour(application).

%%% -- public control --
-export([start/2, stop/1]).

%%% -- public interface --
-export([start_args/1, 
         start_arg/1,
         start_arg/2]).

-include("common.hrl").

%%% -- public control ----------------------------------------------------------
start(_StartType, _StartArgs) ->
    sup@debug:start_link().

stop(_State) ->
    ok.

%%% -- public interface --------------------------------------------------------
start_args([_|_]=RqArgs) ->
    Args = #{} = application:get_env(?APP, start_args, #{}),
    [start_arg(RqArg, Args) || RqArg <- RqArgs].

start_arg(K) ->
    start_arg(K, application:get_env(debug, start_args, #{})).

%% internal functions
start_arg(logger_primary, #{}=Args) ->
    Args0 = maps:get(logger_primary, Args, #{}),
    DfltArgs = #{level => all},
    maps:merge(DfltArgs, Args0);
start_arg(logger_std_h, #{logger_std_h := undefined}) ->
    undefined;
start_arg(logger_std_h, #{}=Args) ->
    Args0 = maps:get(logger_std_h, Args, #{}),
    DfltArgs = 
        #{level => all, filter_default => log, filters => [],
          formatter => 
            {logger_formatter@debug, 
                #{single_line => false, legacy_header => false}}},
    maps:merge(DfltArgs, Args0);
start_arg(logger_file_h,  #{logger_file_h := undefined}) ->
    undefined;
start_arg(logger_file_h, #{}=Args) ->
    Args0 = maps:get(logger_file_h, Args, #{}),
    DfltConfig =
        #{max_no_bytes => 104857600, 
          max_no_files => 10,
          file => filename@debug:site_data(["logger_file_h.log"])},
    DfltArgs = 
        #{config => DfltConfig, 
          formatter => 
            {logger_formatter@debug, 
                #{single_line => false, legacy_header => false}}},
    maps:merge(DfltArgs, Args0);
start_arg(sys_ops, #{}=Args) ->
    maps:get(sys_ops, Args, []).