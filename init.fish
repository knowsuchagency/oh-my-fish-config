## pyenv compatibility
status --is-interactive; and . (pyenv init -|psub)

## bobthefish configuration
set -g theme_nerd_fonts yes

## start ssh-agent
start_ssh_agent

## abbreviations

# python 
abbr -a p python
abbr -a pm python manage.py
abbr -a j jupyter
abbr -a jn jupyter notebook
abbr -a jnc jupyter nbconvert

# git 
abbr -a gs git status
abbr -a ga git add
abbr -a gc git commit
abbr -a gcm git commit -m
abbr -a gp git push


## functions

# python 

function pip-uninstall-all
    pip freeze | grep -v "^-e" | xargs pip uninstall -y
end

function pip-upgrade-all
    pip install -U pip
    pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U
end


# docker

function docker-remove-dangling
    echo "removing docker containers"
    docker rm (docker ps -aq)
    echo "removing docker dangling docker images"
    docker rmi (docker images -f "dangling=true" -q)
end


# cheat sheets

function ch
    if [ (count $argv) -gt 0 ]
        cheat $argv | less
    else
        cheat
    end
end