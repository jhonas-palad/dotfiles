
## Windows

**Terminal**

1. `/terminal/settings.json` contains the configuration for Windows Terminal.

**pwsh**
1. Install oh-my-posh

    ```
    winget install JanDeDobbeleer.OhMyPosh -s winget --location "D:\Program` Files\oh-my-posh"
    ```

2. Install Powershell modules

    ```
    Install-Module PSReadLine
    Install-Module PSFzf
    Install-Module Terminal-Icons
    ```
3. Append script to `$PROFILE`
    ```
    ". `$env:USERPROFILE\.config\powershell\user_profile.ps1" | Out-File -FilePath $PROFILE -Append
    ```
4. Create a `.config` dir in `$USERPROFILE` path

    ```
    New-Item -Path $env:USERPROFILE -Name .config -ItemType Directory -Force && . $PROFILE
    ```
5. Create a symlink pointing to the powershell directory in `.config`. Run Terminal as Administrator

    ```
    New-Item -ItemType SymbolicLink -Path $env:USERPROFILE\.config -Name powershell -Target $env:DOTFILES_PATH\powershell
    ```
6. Add a symlink pointing to our theme in `POSH_THEMES_PATH`

    ```
    New-Item -ItemType SymbolicLink -Path $env:POSH_THEMES_PATH\jhonas2.omp.json -Target $env:DOTFILES_PATH\ompthemes\jhonas2.omp.json
    ```
## WSL

**bash**

1. Remove current startup files with `rm` command. 

    ```
    sudo rm -f {/root,~}/.{bashrc,bash_profile,bash_aliases,bash_logout,inputrc,profile}
    ```
    
2. Create a symlink pointing to the startup files in home directory and root directory. 
    
    ```
    ln -s ~/dotfiles/bash/.{bashrc,bash_aliases,profile,inputrc,bash_logout} ~
    sudo ln -s ~/dotfiles/bash/.{bashrc,inputrc} /root
    ```

3. Create a symlink pointing to the `ompthemes` directory in root and user home directory.(Optional)

    ```
    ln -s ~/dotfiles/ompthemes ~
    sudo ln -s ~/dotfiles/ompthemes /root
    ```
