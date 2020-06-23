-module(logger_formatter@debug).

-export([check_config/1,
         format/2]).

check_config(Config) ->
    logger_formatter:?FUNCTION_NAME(Config).

format(#{meta := #{pid := Pid}, msg := {string, Msg}}=LogEvent, Config) ->
    logger_formatter:?FUNCTION_NAME(
        LogEvent#{msg => {report, [{desc, Msg}, {pid, Pid}]}}, Config);
format(LogEvent, Config) ->
    % io:format("Log event data ~p~n", [LogEvent]),
    logger_formatter:?FUNCTION_NAME(LogEvent, Config).