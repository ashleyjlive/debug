-define(DFLT_LG_ARGS, [{module, ?MODULE}, {function, ?FUNCTION_NAME}, 
                       {app, ?APP}]).

-define(debug(Msg), 
            log@debug:do_log_event(debug, Msg, ?DFLT_LG_ARGS)).
-define(debug(Tag, MsgOrDta), 
            log@debug:do_log_event(debug, Tag, MsgOrDta, ?DFLT_LG_ARGS)).
-define(debug(Tag, Msg, Data), 
            log@debug:do_log_event(debug, Tag, Msg, Data, ?DFLT_LG_ARGS)).

-define(info(Msg), 
            log@debug:do_log_event(info, Msg, ?DFLT_LG_ARGS)).
-define(info(Tag, MsgOrDta), 
            log@debug:do_log_event(info, Tag, MsgOrDta, ?DFLT_LG_ARGS)).
-define(info(Tag, Msg, Data), 
            log@debug:do_log_event(info, Tag, Msg, Data, ?DFLT_LG_ARGS)).

-define(notice(Msg), 
            log@debug:do_log_event(notice, Msg, ?DFLT_LG_ARGS)).
-define(notice(Tag, MsgOrDta), 
            log@debug:do_log_event(notice, Tag, MsgOrDta, ?DFLT_LG_ARGS)).
-define(notice(Tag, Msg, Data), 
            log@debug:do_log_event(notice, Tag, Msg, Data, ?DFLT_LG_ARGS)).

-define(warning(Msg), 
            log@debug:do_log_event(warning, Msg, ?DFLT_LG_ARGS)).
-define(warning(Tag, MsgOrDta), 
            log@debug:do_log_event(warning Tag, MsgOrDta, ?DFLT_LG_ARGS)).
-define(warning(Tag, Msg, Data), 
            log@debug:do_log_event(warning, Tag, Msg, Data, ?DFLT_LG_ARGS)).

-define(error(Msg), 
            log@debug:do_log_event(error, Msg, ?DFLT_LG_ARGS)).
-define(error(Tag, MsgOrDta), 
            log@debug:do_log_event(error, Tag, MsgOrDta, ?DFLT_LG_ARGS)).
-define(error(Tag, Msg, Data), 
            log@debug:do_log_event(error, Tag, Msg, Data, ?DFLT_LG_ARGS)).

-define(critical(Msg), 
            log@debug:do_log_event(critical, Msg, ?DFLT_LG_ARGS)).
-define(critical(Tag, MsgOrDta), 
            log@debug:do_log_event(critical, Tag, MsgOrDta, ?DFLT_LG_ARGS)).
-define(critical(Tag, Msg, Data), 
            log@debug:do_log_event(critical, Tag, Msg, Data, ?DFLT_LG_ARGS)).

-define(alert(Msg), 
            log@debug:do_log_event(alert, Msg, ?DFLT_LG_ARGS)).
-define(alert(Tag, MsgOrDta), 
            log@debug:do_log_event(alert, Tag, MsgOrDta, ?DFLT_LG_ARGS)).
-define(alert(Tag, Msg, Data), 
            log@debug:do_log_event(alert, Tag, Msg, Data, ?DFLT_LG_ARGS)).

-define(emergency(Msg), 
            log@debug:do_log_event(emergency,Msg, ?DFLT_LG_ARGS)).
-define(emergency(Tag, MsgOrDta), 
            log@debug:do_log_event(emergency, Tag, MsgOrDta, ?DFLT_LG_ARGS)).
-define(emergency(Tag, Msg, Data), 
            log@debug:do_log_event(emergency,Tag, Msg, Data, ?DFLT_LG_ARGS)).