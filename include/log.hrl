-define(debug(Msg), log@debug:do_log_event(debug, Msg)).
-define(debug(Tag, MsgOrDta), log@debug:do_log_event(debug, Tag, MsgOrDta)).
-define(debug(Tag, Msg, Data), log@debug:do_log_event(debug, Tag, Msg, Data)).

-define(info(Msg), log@debug:do_log_event(info, Msg)).
-define(info(Tag, MsgOrDta), log@debug:do_log_event(info, Tag, MsgOrDta)).
-define(info(Tag, Msg, Data), log@debug:do_log_event(info, Tag, Msg, Data)).

-define(notice(Msg), log@debug:do_log_event(notice, Msg)).
-define(notice(Tag, MsgOrDta), log@debug:do_log_event(notice, Tag, MsgOrDta)).
-define(notice(Tag, Msg, Data), log@debug:do_log_event(notice, Tag, Msg, Data)).

-define(warning(Msg), log@debug:do_log_event(warning, Msg)).
-define(warning(Tag, MsgOrDta), log@debug:do_log_event(warning Tag, MsgOrDta)).
-define(warning(Tag, Msg, Data), log@debug:do_log_event(warning, Tag, Msg, Data)).

-define(error(Msg), log@debug:do_log_event(error, Msg)).
-define(error(Tag, MsgOrDta), log@debug:do_log_event(error, Tag, MsgOrDta)).
-define(error(Tag, Msg, Data), log@debug:do_log_event(error, Tag, Msg, Data)).

-define(critical(Msg), log@debug:do_log_event(critical, Msg)).
-define(critical(Tag, MsgOrDta), log@debug:do_log_event(critical, Tag, MsgOrDta)).
-define(critical(Tag, Msg, Data), log@debug:do_log_event(critical, Tag, Msg, Data)).

-define(alert(Msg), log@debug:do_log_event(alert, Msg)).
-define(alert(Tag, MsgOrDta), log@debug:do_log_event(alert, Tag, MsgOrDta)).
-define(alert(Tag, Msg, Data), log@debug:do_log_event(alert, Tag, Msg, Data)).

-define(emergency(Msg), log@debug:do_log_event(emergency,Msg)).
-define(emergency(Tag, MsgOrDta), log@debug:do_log_event(emergency, Tag, MsgOrDta)).
-define(emergency(Tag, Msg, Data), log@debug:do_log_event(emergency,Tag, Msg, Data)).