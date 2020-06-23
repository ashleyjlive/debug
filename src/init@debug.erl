-module(init@debug).
-behaviour(gen_server).

%%% -- public control --
-export([start_link/2, stop/0]).

%%% -- gen_server callbacks --
-export([init/1, 
         handle_call/3, 
         handle_cast/2, 
         handle_info/2, 
         terminate/2, 
         code_change/3]).

%%% -- public control ----------------------------------------------------------
start_link(Args, SysOps) ->
   gen_server:start_link({local, ?MODULE}, ?MODULE, Args, SysOps).

stop() ->
   gen_server:stop(?MODULE, stop).

%%% -- gen_server callbacks ----------------------------------------------------
init(#{}=Cfg) ->
    ok = logger:set_primary_config(level, all),
    ignore.

handle_call(stop, _From, State) ->
    {stop, normal, stopped, State};

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%% -- impl --------------------------------------------------------------------

%%% -- helpers -----------------------------------------------------------------