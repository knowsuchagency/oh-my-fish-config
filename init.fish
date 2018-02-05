## pyenv compatibility
#status --is-interactive; and source (pyenv init -|psub)

## bobthefish configuration
setenv theme_nerd_fonts yes

# lang see https://bugs.python.org/issue18378
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# localdocker for kalo lws stuff
setenv LOCALDOCKER 127.0.0.1


## abbreviations

# python 
abbr -a p python
abbr -a pm python manage.py
abbr -a j jupyter
abbr -a jn jupyter notebook
abbr -a jnc jupyter nbconvert
abbr -a pti ptipython
abbr -a pca "gh:knowsuchagency/pyramid-cookiecutter-alchemy"

# pipenv

setenv WORKON_HOME '~/.venvs'


# git 
abbr -a gs git status
abbr -a ga git add
abbr -a gc git commit
abbr -a gcm git commit -m
abbr -a gp git push


# cookiecutter
set -g cookiecutter_url 'https://github.com/knowsuchagency/cookiecutter-pypackage.git'

## functions

# python 

function pip-uninstall-all
    pip freeze | grep -v "^-e" | xargs pip uninstall -y
end

function pip-upgrade-all
    pip install -U pip
    pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U
end


# cookiecutter

function new-package
    cookiecutter $cookiecutter_url
end


# docker

function docker-remove-dangling
    echo "removing docker containers"
    docker rm (docker ps -aq)
    echo "removing docker dangling docker images"
    docker rmi (docker images -f "dangling=true" -q)
end

# mono
setenv MONO_GAC_PREFIX /usr/local

# zappa
function zappashell
    docker run -ti -e AWS_PROFILE=default -v (pwd):/var/task -v ~/.aws/:/root/.aws  --rm lambci/lambda:build-python3.6 bash
end
