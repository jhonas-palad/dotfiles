# Setup SSH Authentication for Git Bash on Windows

## Prepararation

1. Create a folder at the root of your user home folder
   (Example: `C:/Users/username/`) called `.ssh`.\
   You can run something like: `mkdir -p ~/.ssh`
1. Create the following files if they do not already
   exist (paths begin from the root of your user home
   folder):
   - `touch ~/.ssh/config`
   - `touch ~/.bash_profile`
   - `touch ~/.bashrc`

## Create a New SSH Key

Follow the steps in the section named "Generating a new SSH
Key" found in the following documentation from GitHub:
_[Generating a new SSH key and adding it to the ssh-agent](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-windows)_

## Configure SSH for Git Hosting Server

You can use your favorite text editor: `nano, vim, subl, atom, code`\
For example, run `code ~/.ssh/config`

Then, add the following lines to `.ssh/config` which should be found
in the root of your user home folder:

```ini
AddKeysToAgent yes
Host github.com
 Hostname github.com
 IdentityFile ~/.ssh/id_rsa
```

## Enable SSH Agent Startup Whenever Git Bash is Started

Run your editor, e.g. `code ~/.bash_profile` and add the following lines:

```sh
test -f ~/.profile && . ~/.profile
test -f ~/.bashrc && . ~/.bashrc
```

Run your editor, e.g. `code ~/.bashrc` and add the following snippet:

```sh
# Start SSH Agent
#----------------------------

SSH_ENV="$HOME/.ssh/environment"

function run_ssh_env {
  . "${SSH_ENV}" > /dev/null
}

function start_ssh_agent {
  echo "Initializing new SSH agent..."
  ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  echo "succeeded"
  chmod 600 "${SSH_ENV}"

  run_ssh_env;

  ssh-add ~/.ssh/id_rsa;
}

if [ -f "${SSH_ENV}" ]; then
  run_ssh_env;
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_ssh_agent;
  }
else
  start_ssh_agent;
fi
```
