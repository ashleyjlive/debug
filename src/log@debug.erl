-module(log@debug).

-export([do_log_event/2, do_log_event/3, do_log_event/4]).

do_log_event(What, InFmt) ->
    [{registered_name, Nme}, {current_stacktrace, [_|Stck]}] = 
        process_info(self(), [registered_name, current_stacktrace]),
    Nme1 = if Nme =:= [] -> undefined; true -> Nme end,
    do_log_event1(
        What, InFmt, [{registered_name, Nme1}, {stacktrace, Stck}]).

do_log_event(What, Tag, MsgOrDta) ->
    [{registered_name, Nme}, {current_stacktrace, [_|Stck]}] = 
        process_info(self(), [registered_name, current_stacktrace]),
    Nme1 = if Nme =:= [] -> undefined; true -> Nme end,
    do_log_event1(
        What, Tag, MsgOrDta, [{registered_name, Nme1}, {stacktrace, Stck}]).

do_log_event(What, Tag, Msg, Data) ->
    [{registered_name, Nme}, {current_stacktrace, [_|Stck]}] = 
        process_info(self(), [registered_name, current_stacktrace]),
    Nme1 = if Nme =:= [] -> undefined; true -> Nme end,
    do_log_event1(
        What, Tag, Msg, Data,  [{registered_name, Nme1}, {stacktrace, Stck}]).

do_log_event1(What, {_Fmt, Args}=InFmt, AddArgs) when is_list(Args) ->
    do_log_event1(What, undefined, InFmt, AddArgs);
do_log_event1(What, {tag, Tag}, AddArgs) ->
    do_log_event1(What, Tag, undefined, AddArgs);
do_log_event1(What, {data, _}=Dta, AddArgs) ->
    do_log_event1(What, undefined, Dta, AddArgs);
do_log_event1(What, Msg, AddArgs) ->
    do_log_event1(What, undefined, Msg, AddArgs).

do_log_event1(What, Tag, {_Fmt, Args}=InFmt, AddArgs) when is_list(Args) ->
    do_log_event1(What, Tag, InFmt, undefined, AddArgs);
do_log_event1(What, Tag, {data, Data}, AddArgs) ->
    do_log_event1(What, Tag, undefined, Data, AddArgs);
do_log_event1(What, Tag, Msg, AddArgs) ->
    do_log_event1(What, Tag, Msg, undefined, AddArgs).

do_log_event1(What, Tag, {Format, Args}, Data, AddArgs) when is_list(Args) ->
    do_log_event1(What, Tag, io_lib:format(Format, Args), Data, AddArgs);
do_log_event1(What, Tag, Msg, Data, AddArgs) ->
    logger:What(
        [{tag, Tag}, 
         {desc, Msg},
         {data, Data},
         {node, node()},
         {pid, self()}|AddArgs]).