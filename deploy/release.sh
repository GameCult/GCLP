#!/bin/bash
cd ../lp
git pull origin pet
mix deps.get --only prod
# mix phx.digest # once you have something js related
MIX_ENV=prod mix compile
MIX_ENV=prod mix release
_build/prod/rel/lp/bin/lp start
# note, that it is running in terminal 
