#!/usr/bin/env sh

bundle exec puma -C config/puma.rb &
#webpack_dev_server: ./bin/webpack-dev-server
env TERM_CHILD=1 RESQUE_TERM_TIMEOUT=1 QUEUE=high,medium bundle exec rake resque:work &
env TERM_CHILD=1 RESQUE_TERM_TIMEOUT=1 QUEUE=medium bundle exec rake resque:work &
env TERM_CHILD=1 RESQUE_TERM_TIMEOUT=1 QUEUE=low,medium bundle exec rake resque:work &
bundle exec rake resque:scheduler &
