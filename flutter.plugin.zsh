alias fl="fvm flutter"
alias flattach="fvm flutter attach"
alias flb="fvm flutter build"
alias flchnl="fvm flutter channel"
alias flc="fvm flutter clean"
alias fldvcs="fvm flutter devices"
alias fldoc="fvm flutter doctor"
alias flpub="fvm flutter pub"
alias flget="fvm flutter pub get"
alias flr="fvm flutter run"
alias flrd="fvm flutter run --debug"
alias flrp="fvm flutter run --profile"
alias flrr="fvm flutter run --release"
alias flupgrd="fvm flutter upgrade"

# COMPLETION FUNCTION
if (( ! $+commands[flutter] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `flutter`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_flutter" ]]; then
  typeset -g -A _comps
  autoload -Uz _flutter
  _comps[flutter]=_flutter
fi

flutter zsh-completion >| "$ZSH_CACHE_DIR/completions/_flutter" &|