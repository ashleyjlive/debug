-module(log@debug).

-export([do_log_event/3, do_log_event/4, do_log_event/5]).

do_log_event(What, {_Fmt, Args}=InFmt, AddArgs) when is_list(Args) ->
    do_log_event(What, undefined, InFmt, AddArgs);
do_log_event(What, {tag, Tag}, AddArgs) ->
    do_log_event(What, Tag, undefined, AddArgs);
do_log_event(What, {data, _}=Dta, AddArgs) ->
    do_log_event(What, undefined, Dta, AddArgs);
do_log_event(What, Msg, AddArgs) ->
    do_log_event(What, undefined, Msg, AddArgs).

do_log_event(What, Tag, {_Fmt, Args}=InFmt, AddArgs) when is_list(Args) ->
    do_log_event(What, Tag, InFmt, undefined, AddArgs);
do_log_event(What, Tag, {data, Data}, AddArgs) ->
    do_log_event(What, Tag, undefined, Data, AddArgs);
do_log_event(What, Tag, Msg, AddArgs) ->
    do_log_event(What, Tag, Msg, undefined, AddArgs).

do_log_event(What, Tag, {Format, Args}, Data, AddArgs) when is_list(Args) ->
    do_log_event(What, Tag, io_lib:format(Format, Args), Data, AddArgs);
do_log_event(What, Tag, Msg, Data, AddArgs) ->
    logger:What(
        [{tag, Tag}, 
         {desc, Msg},
         {data, Data},
         {node, node()},
         {pid, self()}|AddArgs]).