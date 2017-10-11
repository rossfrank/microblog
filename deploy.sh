#!/bin/bash

#modified from deploy.sh from https://github.com/NatTuck/nu_mart/blob/master/deploy.sh

DIR="/home/microblog"

mix deps.get
(cd assets && npm install)
(cd assets && ./node_modules/brunch/bin/brunch b -p)
mix phx.digest
mix release --env=prod

service microblog stop

mix ecto.migrate

cp _build/prod/rel/microblog/releases/0.0.1/microblog.tar.gz $DIR
(cd $DIR/microblog && tar xzvf microblog.tar.gz)

service microblog start
