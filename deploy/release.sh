#!/bin/bash
cd ../lp
# git pull origin pet
mix deps.get --only prod
MIX_ENV=prod mix compile
npm install --prefix ./assets
npm run deploy --prefix ./assets
mix phx.digest # once you have something js related
MIX_ENV=prod mix release
sudo _build/prod/rel/lp/bin/lp start
# note, that it is running in terminal 
