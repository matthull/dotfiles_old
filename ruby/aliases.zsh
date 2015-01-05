alias websrv='ruby -run -ehttpd . -p8000'
alias prm='bundle exec pry-remote'
alias ttr='touch tmp/restart.txt'
alias ct='(ag -alL "\\\$scope" tmp/cache/assets/development/sprockets | xargs ag -al templateCache.put | xargs rm) && ttr'
