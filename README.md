
### Bash
**WSL**

Remove current startup files with `rm` command. 
```
sudo rm -f {/root,~}/.{bashrc,bash_profile,bash_aliases,inputrc}
```
Create a symlink for startup files in home directory and root directory. 
```
ln -s ~/dotfiles/bash/.{bashrc,bash_aliases,bash_profile,inputrc} ~
sudo ln -s ~/dotfiles/bash/.{bashrc,inputrc} /root
```

Create a symlink for `ompthemes` directory in root and user home directory.
```
ln -s ~/dotfiles/ompthemes ~
sudo ln -s ~/dotfiles/ompthemes /root
```
