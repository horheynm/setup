#-------------------------------------------------------------
# Git Alias Commands
#-------------------------------------------------------------
alias g="git status"
alias ga="git add"
alias gaa="git add ."
alias gau="git add -u"
alias gc="git commit -m"
alias gca="git commit -am"
alias gb="git branch"
alias gbd="git branch -d"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gt="git stash"
alias gta="git stash apply"
alias gm="git merge"
alias gr="git rebase"
alias gl="git log --oneline --decorate --graph"
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias glga="git log --graph --oneline --all --decorate"
alias gb="git branch"
alias gs="git show"
alias gd="diff --color --color-words --abbrev"
alias gdc="git diff --cached"
alias gbl="git blame"
alias gps="git push"
alias gpl="git pull"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"
alias go="git checkout "
alias gk="gitk --all&"
alias gx="gitx --all"

# show ignored files by git
alias gx="ign = ls-files -o -i --exclude-standard"

# Untrack Files without deleting them
alias grmc="git rm -r --cached"

senv() {
    local dir="${1:-.venv}"   # default to .venv if no argument

    if [ -f "$dir/bin/activate" ]; then
        # shellcheck disable=SC1090
        . "$dir/bin/activate"
    else
        echo "No virtualenv activate script at: $dir/bin/activate" >&2
        return 1
    fi
}

pyv() {
    local dir="${1:-.venv}"   # default to .venv if no arg

    if ! command -v python3 >/dev/null 2>&1; then
        echo "python3 not found on PATH" >&2
        return 1
    fi

    python3 -m venv "$dir"
}

pyc() {
    local devs

    # No arguments: default to device 0, open Python REPL
    if [ $# -eq 0 ]; then
        devs="0"
        CUDA_VISIBLE_DEVICES="$devs" python3
        return
    fi

    # If first arg looks like a device list (e.g. "0" or "0,1,2")
    if [[ "$1" =~ ^[0-9,]+$ ]]; then
        devs="$1"
        shift
    else
        # Otherwise default to GPU 0 and treat all args as python args
        devs="0"
    fi

    CUDA_VISIBLE_DEVICES="$devs" python3 "$@"
}

alias py='python3'


# pip via python (respect current venv)
alias pyp='python3 -m pip'
alias pi='python3 -m pip install'
alias pir='python3 -m pip install -r requirements.txt'
alias pif='python3 -m pip freeze > requirements.txt'

# pytest shortcuts
alias pt='pytest'
alias ptf='pytest -x -vv'      # fail fast, verbose
alias ptr='pytest -q'          # quiet

# Quickly check GPUs
alias nvg='nvidia-smi'
alias nvgw='watch -n 1 nvidia-smi'


################
# Docker 
################

alias dps='docker ps'
alias dpa='docker ps -a'
alias di='docker images'
alias drm='docker rm'
alias drmi='docker rmi'

# Exec into running container: dexec <name-or-id>
dexec() {
    if [ -z "$1" ]; then
        echo "Usage: dexec <container>" >&2
        return 1
    fi
    docker exec -it "$1" bash
}

#########
# tmux  #
#########

alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tls='tmux ls'