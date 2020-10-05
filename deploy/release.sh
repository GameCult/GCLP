#!/bin/bash
cd ../lp
sudo _build/prod/rel/lp/bin/lp stop
# git pull origin pet
mix deps.get --only prod
MIX_ENV=prod mix compile
npm install --prefix ./assets
npm run deploy --prefix ./assets
mix phx.digest # once you have something js related
MIX_ENV=prod mix release
sudo _build/prod/rel/lp/bin/lp daemon

# note, that it is running in terminal 


    # start          Starts the system
    # start_iex      Starts the system with IEx attached
    # daemon         Starts the system as a daemon
    # daemon_iex     Starts the system as a daemon with IEx attached
    # eval "EXPR"    Executes the given expression on a new, non-booted system
    # rpc "EXPR"     Executes the given expression remotely on the running system
    # remote         Connects to the running system via a remote shell
    # restart        Restarts the running system via a remote command
    # stop           Stops the running system via a remote command
    # pid            Prints the operating system PID of the running system via a remote command
    # version        Prints the release name and version to be booted