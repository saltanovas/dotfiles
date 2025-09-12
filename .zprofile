export JAVA_HOME=$(/usr/libexec/java_home -v 24)
export PATH=$JAVA_HOME/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

eval "$(/opt/homebrew/bin/brew shellenv)"