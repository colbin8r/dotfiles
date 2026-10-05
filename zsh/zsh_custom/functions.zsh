# Use an "extract" command to unzip files
# https://news.ycombinator.com/item?id=18987485
function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Shorthand for `mkdir [folder] && cd [folder]`
function mkd() {
  mkdir -p -- "$1" && cd -P -- "$1"
}

# Shorthand for `docker exec -it [container] /bin/bash`
# into `db [container]`
function db() {
  docker exec -it $1 /bin/bash
}

# Shorthand for `docker kill [container]`
# into `dk [container]`
function dk() {
  docker kill $1
}

# Stops all running docker containers
# http://blog.baudson.de/blog/stop-and-remove-all-docker-containers-and-images
function dkall() {
  docker stop $(docker ps -aq)
}

# Shorthand for `docker ps`
function dps() {
  docker ps "$@"
}

# Shorthand for `docker inspect`
function di() {
  docker inspect "$@"
}