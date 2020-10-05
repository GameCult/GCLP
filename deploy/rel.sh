#!/bin/bash
# don't forget to modify it, according to your db credentials
if [ -z "$DATABASE_URL"]; then 
echo 'export DATABASE_URL=ecto://postgres:postgres@localhost/lp_dev' >> ~/.bashrc
fi
if [ -z "$SECRET_KEY_BASE"]; then 
key=`mix phx.gen.secret`
echo 'export SECRET_KEY_BASE='$key >> ~/.bashrc
fi
if [ -z "$PORT"]; then 
echo 'export PORT=443' >> ~/.bashrc
fi