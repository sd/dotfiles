#==============================================================================
# Docker Tricks
#==============================================================================
alias d="docker"
alias dma="docker-machine"
alias dco="docker-compose"
alias dcr='docker-compose run $(basename $PWD) "${@}"'

# For docker-compose based projects, with a local rakefile at the root level, and per-service directories where you want to invoke tasks
function lrake() {
  if [ -f "./Dockerfile" ]; then
    DIR=$(basename $PWD)
    echo "rake --rakefile ../Rakefile ${@} DIR=$DIR"
    pushd .. >/dev/null
    rake ${@} DIR=$DIR
    popd >/dev/null
  else
    rake ${@}
  fi
}
