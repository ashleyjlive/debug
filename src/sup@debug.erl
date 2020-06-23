%%%-------------------------------------------------------------------
%% @doc debug top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(sup@debug).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% sup_flags() = #{strategy => strategy(),         % optional
%%                 intensity => non_neg_integer(), % optional
%%                 period => pos_integer()}        % optional
%% child_spec() = #{id => child_id(),       % mandatory
%%                  start => mfargs(),      % mandatory
%%                  restart => restart(),   % optional
%%                  shutdown => shutdown(), % optional
%%                  type => worker(),       % optional
%%                  modules => modules()}   % optional
init([]) ->
    [SysOps,PrimaryCfg,LgrStdH,LgrFleH] = 
        app@debug:start_args(
            [sys_ops,logger_primary,logger_std_h,logger_file_h]),
    SupFlags = #{strategy => one_for_all,
                 intensity => 0,
                 period => 1},
    ChildSpecs = 
        [init_child_spec(PrimaryCfg, SysOps),
         logger_std_h_child_spec(LgrStdH, SysOps),
         logger_file_h_child_spec(LgrFleH, SysOps)],
    {ok, {SupFlags, ChildSpecs}}.

init_child_spec(#{}=Args, SysOps) when is_list(SysOps) ->
    #{id => init@debug, 
      start => {init@debug, start_link, [Args, SysOps]},
      restart => transient,
      type => worker,
      modules => [init@debug]}.

logger_file_h_child_spec(#{}=Args, SysOps) when is_list(SysOps) ->
    #{id => logger_file_h@debug, 
      start => {logger_file_h@debug, start_link, [Args, SysOps]},
      restart => permanent,
      type => worker,
      modules => [logger_file_h@debug]}.

logger_std_h_child_spec(#{}=Args, SysOps) when is_list(SysOps) ->
    #{id => logger_std_h@debug, 
      start => {logger_std_h@debug, start_link, [Args, SysOps]},
      restart => permanent,
      type => worker,
      modules => [logger_std_h@debug]}.

%% internal functions
